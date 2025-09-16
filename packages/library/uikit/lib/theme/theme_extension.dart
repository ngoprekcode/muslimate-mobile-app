import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// Get ThemeData from context.
  ThemeData get theme => Theme.of(this);

  /// Get TextTheme from context.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get ColorScheme from context.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
