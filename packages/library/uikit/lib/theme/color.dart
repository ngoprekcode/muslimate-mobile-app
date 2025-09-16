import 'package:flutter/material.dart';
import 'package:uikit/generated/colors.gen.dart';

final ColorScheme lightColorScheme = const ColorScheme.light(
  // Primary color is the main brand color used for key components.
  // Examples: FAB, prominent buttons, active states.
  primary: AppColors.primaryColor,

  // onPrimary is the color for content (text, icons) on top of the primary color.
  // It provides high contrast for accessibility.
  onPrimary: Colors.white,

  // Secondary color is used for less prominent components that support the main UI.
  // Examples: Filter chips, secondary buttons.
  secondary: AppColors.secondaryColor,

  // onSecondary is for content (text, icons) on top of the secondary color.
  onSecondary: Colors.black,

  // Surface is the color for container backgrounds, such as Cards, Dialogs, and the general Scaffold background.
  // In M3, it replaces the deprecated 'background' property.
  surface: Colors.white,

  // onSurface is for content (text, icons) on top of the surface color.
  // It's the default text color for most of your app's UI.
  onSurface: Colors.black,

  // Error color is used to indicate an error state in components.
  // Examples: Error text in forms, a broken button.
  error: Colors.red,

  // onError is for content (text, icons) on top of the error color.
  onError: Colors.white,
);