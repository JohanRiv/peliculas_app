import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecomendationListScreen extends StatelessWidget {
  const RecomendationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  child: InfiniteListMoviesWidget(
                    movies: moviesProvider.movieInfiniteList,
                    nextPage: () => moviesProvider.getOnDisplayInfiniteMovies(),
                  )),
            )
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Center(
        child: Text(
          "Recomendation List",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      expandedHeight: 50,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
      ),
    );
  }
}
