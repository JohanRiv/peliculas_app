import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas_app/themes/themes.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: const FadeInImage(
                  fadeInDuration: Duration(milliseconds: 300),
                  fit: BoxFit.fill,
                  placeholder: AssetImage('assets/images/gray_background.jpg'),
                  image: NetworkImage('https://via.placeholder.com/300x400')),
            );
          },
        ),
      ),
    );
  }
}
