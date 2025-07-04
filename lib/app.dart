import 'package:crobros/Utils/theme/Theme.dart' show TAppTheme;
import 'package:crobros/Utils/theme/custom_themes/appbar_theme.dart' as theme;
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
    );
  }
}
