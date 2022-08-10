import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CastingSwiperWidget extends StatelessWidget {
  CastingSwiperWidget({Key? key, required this.movieId}) : super(key: key);

  int movieId = 0;

  @override
  Widget build(BuildContext context) {
    MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCasting(movieId),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Container(
              height: 180,
              width: 30,
              child: Center(
                child: Container(
                  height: 30,
                  width: 30,
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
                ),
              ),
            ),
          );
        } else {
          final List<Cast> cast = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: cast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CastCards(
                  castIntem: cast[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}

class CastCards extends StatelessWidget {
  CastCards({Key? key, required this.castIntem}) : super(key: key);
  Cast castIntem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 210,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            height: 140,
            width: 130,
            image: NetworkImage(castIntem.getImgFullPath()),
            placeholder: const AssetImage("assets/images/gray_background.jpg"),
            fadeInDuration: const Duration(milliseconds: 300),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          castIntem.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
