#!/bin/bash

# Definition of colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Mobile Theme Color Adder ===${NC}"
echo "This script will add a new color to the mobile theme architecture."

# Prompt for color name
read -p "Enter the color name (camelCase, e.g. brandSuccess): " COLOR_NAME

if [ -z "$COLOR_NAME" ]; then
  echo -e "${RED}Color name cannot be empty.${NC}"
  exit 1
fi

# Function to normalize hex color
normalize_hex() {
  local input=$1
  # Remove # if present
  local clean="${input/\#/}"
  # Ensure it is 6 chars
  if [ ${#clean} -ne 6 ]; then
    echo "INVALID"
  else
    echo "0xFF$(echo "$clean" | tr '[:lower:]' '[:upper:]')"
  fi
}

# Prompt for Light Mode Color
read -p "Enter Light Mode Hex (e.g. #FFFFFF): " LIGHT_HEX_INPUT
LIGHT_HEX=$(normalize_hex "$LIGHT_HEX_INPUT")

if [ "$LIGHT_HEX" == "INVALID" ]; then
    echo -e "${RED}Invalid Hex format. Please use 6 characters (e.g. FFFFFF)${NC}"
    exit 1
fi

# Prompt for Dark Mode Color
read -p "Enter Dark Mode Hex (e.g. #000000): " DARK_HEX_INPUT
DARK_HEX=$(normalize_hex "$DARK_HEX_INPUT")

if [ "$DARK_HEX" == "INVALID" ]; then
    echo -e "${RED}Invalid Hex format. Please use 6 characters (e.g. FFFFFF)${NC}"
    exit 1
fi

echo -e "${GREEN}Adding $COLOR_NAME...${NC}"

# Absolute Paths
MOBILE_ROOT="$(dirname "$(realpath "$0")")"
INTERFACE_FILE="$MOBILE_ROOT/lib/theme/app_color_interface.dart"
EXTENSIONS_FILE="$MOBILE_ROOT/lib/theme/theme_extensions.dart"
LIGHT_THEME_FILE="$MOBILE_ROOT/lib/theme/light_themes.dart"
DARK_THEME_FILE="$MOBILE_ROOT/lib/theme/dark_themes.dart"

# Helper to check if file exists
if [ ! -f "$INTERFACE_FILE" ]; then
    echo -e "${RED}Error: Could not find theme files. Are you sure the script is in the mobile/ directory?${NC}"
    echo "Checked: $INTERFACE_FILE"
    exit 1
fi

# 1. Update Interface
# Insert before 'ColorScheme get colorScheme;'
sed -i '' "s/ColorScheme get colorScheme;/Color get $COLOR_NAME;\\
  ColorScheme get colorScheme;/" "$INTERFACE_FILE"
echo "Updated Interface."

# 2. Update Extensions
# Insert before '// Custom Colors'
sed -i '' "s/\/\/ Custom Colors/@override\\
  Color get $COLOR_NAME => _theme.$COLOR_NAME;\\
\\
  \/\/ Custom Colors/" "$EXTENSIONS_FILE"
echo "Updated Theme Extensions."

# 3. Update Light Theme
# Find line number of 'ColorScheme get colorScheme'
LINE_NUM=$(grep -n "ColorScheme get colorScheme" "$LIGHT_THEME_FILE" | cut -d: -f1)
# Subtract 1 to before @override
INSERT_LINE=$((LINE_NUM - 1))

insertion_block="  @override\\
  Color get $COLOR_NAME => const Color($LIGHT_HEX);"

sed -i '' "${INSERT_LINE}i\\
$insertion_block\\
" "$LIGHT_THEME_FILE"
echo "Updated Light Theme."

# 4. Update Dark Theme
LINE_NUM_DARK=$(grep -n "ColorScheme get colorScheme" "$DARK_THEME_FILE" | cut -d: -f1)
INSERT_LINE_DARK=$((LINE_NUM_DARK - 1))

insertion_block_dark="  @override\\
  Color get $COLOR_NAME => const Color($DARK_HEX);"

sed -i '' "${INSERT_LINE_DARK}i\\
$insertion_block_dark\\
" "$DARK_THEME_FILE"
echo "Updated Dark Theme."

echo -e "${GREEN}Success! Added $COLOR_NAME to all theme files.${NC}"
echo -e "${BLUE}Please run 'flutter format .' to clean up indentation.${NC}"
