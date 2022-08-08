import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:peliculas_app/screens/screens.dart';
import 'package:peliculas_app/themes/light_theme.dart';
import 'package:peliculas_app/providers/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

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
        'recomendationList': ((context) => RecomendationListScreen()),
      },
      theme: LightTheme.lightTheme,
    );
  }
}
