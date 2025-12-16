import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'light_themes.dart';
import 'dark_themes.dart';

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

class AppThemeBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AppTheme theme) builder;

  const AppThemeBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.platformBrightnessOf(context);
    // Or check if there's a user setting overrides
    bool isDark = brightness == Brightness.dark;

    var orientation = MediaQuery.orientationOf(context);
    var size = MediaQuery.sizeOf(context);

    // Split View Check:
    // If width is constrained (e.g. split view on landscape tablet/phone),
    // force "Portrait" (Vertical) styling even if aspect ratio might technically be landscape
    // or if the user considers it "Landscape mode" physically.
    // A standard breakpoint for "Mobile" width is 600.
    var effectiveOrientation = orientation;
    if (size.width < 600) {
      effectiveOrientation = Orientation.portrait;
    }

    var shortestSide = size.shortestSide;
    var deviceType = shortestSide > 600 ? DeviceType.tablet : DeviceType.mobile;

    AppTheme theme = switch ((isDark, deviceType, effectiveOrientation)) {
      (true, DeviceType.tablet, Orientation.landscape) =>
        TabletLandscapeDarkTheme(),
      (true, DeviceType.tablet, _) => TabletPortraitDarkTheme(),
      (true, DeviceType.mobile, Orientation.landscape) =>
        MobileLandscapeDarkTheme(),
      (true, DeviceType.mobile, _) => MobilePortraitDarkTheme(),
      (false, DeviceType.tablet, Orientation.landscape) =>
        TabletLandscapeLightTheme(),
      (false, DeviceType.tablet, _) => TabletPortraitLightTheme(),
      (false, DeviceType.mobile, Orientation.landscape) =>
        MobileLandscapeLightTheme(),
      (false, DeviceType.mobile, _) => MobilePortraitLightTheme(),
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
