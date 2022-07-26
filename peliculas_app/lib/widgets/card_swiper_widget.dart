import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas_app/themes/themes.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String movieStars = "8.0";
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 320,
        child: Swiper(
          pagination: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            Widget child = Container(
                child: PageIndicator(
              count: config.itemCount,
              controller: config.pageController!,
              layout: config.indicatorLayout,
              size: 10,
              activeColor: LightTheme.primary,
              color: LightTheme.third,
              space: 3,
            ));
            if (!config.outer!) {
              child = Align(
                key: key,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 340),
                  child: child,
                ),
              );
            }
            return child;
          }),
          itemCount: 4,
          viewportFraction: 0.5,
          scale: 0.8,
          outer: false,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details',
                    arguments: 'movie-taped'),
                child:
                    Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const FadeInImage(
                        height: 310,
                        fadeInDuration: Duration(milliseconds: 300),
                        fit: BoxFit.fill,
                        placeholder:
                            AssetImage('assets/images/gray_background.jpg'),
                        image: NetworkImage(
                            'https://via.placeholder.com/300x400')),
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
                              movieStars,
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
