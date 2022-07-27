import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Strart Provider');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('Gest Movies');
  }
}
