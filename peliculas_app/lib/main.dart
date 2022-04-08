import 'package:flutter/material.dart';

import 'package:peliculas_app/screens/screens.dart';
import 'package:peliculas_app/themes/light_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouMo',
      initialRoute: 'home',
      routes: {
        'home': ((context) => HomeScreen()),
        'details': ((context) => DetailsScreen()),
      },
      theme: LightTheme.lightTheme,
    );
  }
}
