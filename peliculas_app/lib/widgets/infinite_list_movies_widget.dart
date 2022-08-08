import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:peliculas_app/models/models.dart';

class InfiniteListMoviesWidget extends StatefulWidget {
  final List<Movie> movies;
  final Function nextPage;

  const InfiniteListMoviesWidget(
      {Key? key, required this.movies, required this.nextPage})
      : super(key: key);

  @override
  _InfiniteListMoviesWidgetState createState() =>
      _InfiniteListMoviesWidgetState();
}

class _InfiniteListMoviesWidgetState extends State<InfiniteListMoviesWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 300)) {
        print("Pre");
        print(widget.movies.length.toString());
        widget.nextPage();
        print("Post");
        print(widget.movies.length.toString());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
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
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: widget.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (() => Navigator.pushNamed(context, 'details',
                    arguments: widget.movies[index])),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                      title: Text(
                        widget.movies[index].title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                          "Release Date: " +
                              widget.movies[index].releaseDate.toString(),
                          overflow: TextOverflow.ellipsis),
                      leading: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: FadeInImage(
                            width: 50,
                            height: 90,
                            fadeInDuration: const Duration(milliseconds: 300),
                            fit: BoxFit.fill,
                            placeholder: const AssetImage(
                                'assets/images/gray_background.jpg'),
                            image:
                                NetworkImage(widget.movies[index].fullPathImg)),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(widget.movies[index].voteAverage.toString())
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
