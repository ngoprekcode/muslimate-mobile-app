import 'package:flutter/material.dart';
import 'package:uikit/theme/theme_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Page',
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
