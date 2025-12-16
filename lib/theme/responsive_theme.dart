import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_theme.dart';
import 'light_themes.dart';
import 'dark_themes.dart';
import 'theme_provider.dart';

enum DeviceType { mobile, tablet }

class ThemeConfig extends InheritedWidget {
  final AppTheme theme;
  final DeviceType deviceType;
  final Orientation orientation;
  final bool isDarkMode;

  const ThemeConfig({
    super.key,
    required this.theme,
    required this.deviceType,
    required this.orientation,
    required this.isDarkMode,
    required super.child,
  });

  static ThemeConfig of(BuildContext context) {
    final ThemeConfig? result = context
        .dependOnInheritedWidgetOfExactType<ThemeConfig>();
    assert(result != null, 'No ThemeConfig found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeConfig oldWidget) {
    return theme != oldWidget.theme ||
        deviceType != oldWidget.deviceType ||
        orientation != oldWidget.orientation ||
        isDarkMode != oldWidget.isDarkMode;
  }
}

class AppThemeBuilder extends ConsumerWidget {
  final Widget Function(BuildContext context, AppTheme theme) builder;

  const AppThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    var brightness = MediaQuery.platformBrightnessOf(context);
    bool isDark;

    isDark = switch (themeMode) {
      .system => brightness == .dark,
      .dark => true,
      .light => false,
    };

    var orientation = MediaQuery.orientationOf(context);
    var size = MediaQuery.sizeOf(context);

    // Split View Check:
    // If width is constrained (e.g. split view on landscape tablet/phone),
    // force "Portrait" (Vertical) styling even if aspect ratio might technically be landscape
    // or if the user considers it "Landscape mode" physically.
    // A standard breakpoint for "Mobile" width is 600.
    Orientation effectiveOrientation = orientation;
    if (size.width < 600) {
      effectiveOrientation = .portrait;
    }

    var shortestSide = size.shortestSide;
    DeviceType deviceType = shortestSide > 600 ? .tablet : .mobile;

    AppTheme theme = switch ((isDark, deviceType, effectiveOrientation)) {
      (true, .tablet, .landscape) => TabletLandscapeDarkTheme(),
      (true, .tablet, _) => TabletPortraitDarkTheme(),
      (true, .mobile, .landscape) => MobileLandscapeDarkTheme(),
      (true, .mobile, _) => MobilePortraitDarkTheme(),
      (false, .tablet, .landscape) => TabletLandscapeLightTheme(),
      (false, .tablet, _) => TabletPortraitLightTheme(),
      (false, .mobile, .landscape) => MobileLandscapeLightTheme(),
      (false, .mobile, _) => MobilePortraitLightTheme(),
    };

    return ThemeConfig(
      theme: theme,
      deviceType: deviceType,
      orientation: orientation,
      isDarkMode: isDark,
      child: builder(context, theme),
    );
  }
}
