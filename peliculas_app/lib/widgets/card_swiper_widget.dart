import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/themes/themes.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

class CardSwiperWidget extends StatelessWidget {
  CardSwiperWidget({Key? key, required this.movies})
      : super(
          key: key,
        );

  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return Container(
        width: double.infinity,
        child: Center(
          child: Stack(children: [
            if (Platform.isAndroid)
              const CircularProgressIndicator()
            else
              const CupertinoActivityIndicator()
          ]),
        ),
      );
    } else {
      MoviesProvider moviesProvider =
          Provider.of<MoviesProvider>(context, listen: false);
      final size = MediaQuery.of(context).size;

      return Scaffold(
        body: Container(
          width: size.width,
          height: 320,
          child: Swiper(
            itemCount: movies.length,
            viewportFraction: 0.5,
            scale: 0.8,
            outer: false,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'details',
                        arguments: movies[index]);
                  },
                  child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: FadeInImage(
                              height: 310,
                              fadeInDuration: const Duration(milliseconds: 300),
                              fit: BoxFit.fill,
                              placeholder: const AssetImage(
                                  'assets/images/gray_background.jpg'),
                              image: NetworkImage(movies[index].fullPathImg)),
                        ),
                        Card(
                          color: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topLeft: Radius.circular(50))),
                          child: Container(
                            width: 65,
                            height: 100,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber.shade400,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    movies[index].voteAverage.toString(),
                                    style: const TextStyle(
                                        color: LightTheme.secondaryText),
                                  )
                                ]),
                          ),
                        ),
                      ]));
            },
          ),
        ),
      );
    }
  }
}
