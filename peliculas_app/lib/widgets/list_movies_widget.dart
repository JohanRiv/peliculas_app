import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:peliculas_app/models/models.dart';

class ListMoviesWidget extends StatelessWidget {
  ListMoviesWidget({Key? key, required this.movies}) : super(key: key);

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
      return SizedBox(
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (() => Navigator.pushNamed(context, 'details',
                    arguments: 'movie-taped')),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                      title: Text(
                        movies[index].title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          "Release Date: " +
                              movies[index].releaseDate.toString(),
                          overflow: TextOverflow.ellipsis),
                      leading: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: FadeInImage(
                            width: 50,
                            height: 50,
                            fadeInDuration: const Duration(milliseconds: 300),
                            fit: BoxFit.fill,
                            placeholder: const AssetImage(
                                'assets/images/gray_background.jpg'),
                            image: NetworkImage(movies[index].fullPathImg)),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(movies[index].voteAverage.toString())
                        ],
                      )),
                  margin: const EdgeInsets.only(bottom: 20),
                ),
              );
            }),
      );
    }
  }
}
