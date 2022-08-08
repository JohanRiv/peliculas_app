import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie_model.dart';
import 'package:peliculas_app/themes/themes.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            _CustomAppBar(),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: FadeInImage(
                              width: 400,
                              height: 450,
                              fadeInDuration: const Duration(milliseconds: 300),
                              fit: BoxFit.fill,
                              placeholder: const AssetImage(
                                  'assets/images/gray_background.jpg'),
                              image: NetworkImage(movie.fullPathImg)),
                        ),
                        Card(
                          color: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topLeft: Radius.circular(50))),
                          child: Container(
                            width: 70,
                            height: 120,
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
                                    movie.voteAverage.toString(),
                                    style: const TextStyle(
                                        color: LightTheme.secondaryText),
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      movie.originalTitle,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Colors.purple,
                        ),
                        Text(" Release date: " + movie.releaseDate.toString()),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultTabController(
                        initialIndex: 0,
                        length: 2,
                        child: Column(
                          children: [
                            TabBar(
                                physics: const BouncingScrollPhysics(),
                                isScrollable: true,
                                tabs: [
                                  Tab(
                                    child: Container(
                                      width: 130,
                                      height: 45,
                                      child: const Center(
                                          child: Text("Description")),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      width: 120,
                                      height: 45,
                                      child:
                                          const Center(child: Text("Casting")),
                                    ),
                                  ),
                                ],
                                indicatorSize: TabBarIndicatorSize.label,
                                labelStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                labelColor: LightTheme.secundary,
                                unselectedLabelColor: LightTheme.primaryText,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: LightTheme.primary)),
                            SizedBox(
                              height: 360,
                              width: MediaQuery.of(context).size.width,
                              child: TabBarView(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        movie.overview,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.justify,
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CastingSwiperWidget()
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              )
            ]))
          ],
        ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.card_membership_sharp, color: LightTheme.primary))
      ],
      backgroundColor: Colors.white,
      expandedHeight: 50,
      floating: false,
      pinned: true,
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
      ),
    );
  }
}
