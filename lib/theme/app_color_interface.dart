import 'package:flutter/material.dart';

abstract interface class AppColorInterface {
  Color get foreground;
  Color get card;
  Color get cardForeground;
  Color get popover;
  Color get popoverForeground;
  Color get primary;
  Color get primaryForeground;
  Color get secondary;
  Color get secondaryForeground;
  Color get muted;
  Color get mutedForeground;
  Color get accent;
  Color get accentForeground;
  Color get destructive;
  Color get destructiveForeground;
  Color get border;
  Color get input;
  Color get ring;

  ColorScheme get colorScheme;
  Color get surfaceHighlight;
  Color get customBrandColor;
}
