import 'package:flutter/material.dart';
import 'package:peliculas_app/helpers/helpers.dart';
import 'package:peliculas_app/providers/movies_provider.dart';

import 'package:peliculas_app/themes/themes.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: true);
    double horizontalAlign = 20;

    Widget welcomeSection() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalAlign),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome Back to YouMo',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Hi, estimate user',
                    style: TextStyle(fontSize: 15, color: LightTheme.thirdText))
              ],
            ),
            const Icon(
              Icons.notification_add_outlined,
              size: 40,
            )
          ],
        ),
      );
    }

    Widget searchSection() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalAlign, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200),
              width: MediaQuery.of(context).size.width * 0.72,
              height: 45,
              child: TextFormField(
                onTap: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                readOnly: true,
                autocorrect: true,
                autofocus: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search, size: 20),
                    filled: false,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: InputBorder.none,
                    hintText: 'Search Movie'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: LightTheme.primary),
              width: MediaQuery.of(context).size.width * 0.15,
              height: 45,
              child: TextButton(
                  onPressed: () => {},
                  child: const Icon(Icons.tune_rounded),
                  style: TextButton.styleFrom(
                    primary: LightTheme.secundary,
                  )),
            )
          ],
        ),
      );
    }

    Widget sliderFilter() {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: DefaultTabController(
              initialIndex: 0,
              length: HomeMenuOptions().options.length,
              child: Column(
                children: [
                  TabBar(
                      physics: const BouncingScrollPhysics(),
                      isScrollable: true,
                      tabs: [
                        ...HomeMenuOptions()
                            .options
                            .map(((e) => Tab(
                                  text: e,
                                )))
                            .toList()
                      ],
                      labelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      labelColor: LightTheme.primary,
                      unselectedLabelColor: LightTheme.thirdText,
                      indicator: const BoxDecoration(color: null)),
                  SizedBox(
                    height: 360,
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      children: [
                        Center(
                            child: CardSwiperWidget(
                                movies: moviesProvider.popularMovieList)),
                        Center(
                            child: CardSwiperWidget(
                                movies: moviesProvider.topReatedMovieList)),
                        Center(
                            child: CardSwiperWidget(
                                movies: moviesProvider.upComingMovieList)),
                      ],
                    ),
                  )
                ],
              )));
    }

    Widget recomendationsRow() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalAlign),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recomendations',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "recomendationList");
                  },
                  child: Text('See all',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: LightTheme.primary)))
            ],
          ),
          SizedBox(
              height: 360,
              width: MediaQuery.of(context).size.width,
              child: ListMoviesWidget(movies: moviesProvider.movieList))
        ]),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: ListView(children: [
          Column(children: [
            welcomeSection(),
            searchSection(),
            sliderFilter(),
            recomendationsRow(),
          ]),
        ]),
      ),
    );
  }
}
