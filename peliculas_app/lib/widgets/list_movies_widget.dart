import 'package:flutter/material.dart';

class ListMoviesWidget extends StatelessWidget {
  const ListMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> movies = [
      {
        'name': 'Movie Power',
        'producer': 'Producer 1',
        'img': 'img',
        'favorite': false
      },
      {
        'name': 'Movie 2',
        'producer': 'Producer 2',
        'img': 'img2',
        'favorite': true
      },
      {
        'name': 'Movie 3',
        'producer': 'Producer 3',
        'img': 'img2',
        'favorite': false
      },
      {
        'name': 'Movie 4',
        'producer': 'Producer 4',
        'img': 'img2',
        'favorite': true
      },
      {
        'name': 'Movie 4',
        'producer': 'Producer 4',
        'img': 'img2',
        'favorite': true
      },
    ];

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
                    movies[index]['name'],
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(movies[index]['producer'],
                      overflow: TextOverflow.ellipsis),
                  leading: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: const FadeInImage(
                        width: 50,
                        height: 50,
                        fadeInDuration: Duration(milliseconds: 300),
                        fit: BoxFit.fill,
                        placeholder:
                            AssetImage('assets/images/gray_background.jpg'),
                        image: NetworkImage(
                            'https://via.placeholder.com/300x400')),
                  ),
                  trailing: Icon(
                    (movies[index]['favorite']
                        ? Icons.star
                        : Icons.star_border),
                    color: (movies[index]['favorite']
                        ? Colors.amber
                        : Colors.grey),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 20),
              ),
            );
          }),
    );
  }
}
