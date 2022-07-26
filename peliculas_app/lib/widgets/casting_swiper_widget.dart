import 'package:flutter/material.dart';

class CastingSwiperWidget extends StatelessWidget {
  const CastingSwiperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CastCards();
        },
      ),
    );
  }
}

class CastCards extends StatelessWidget {
  const CastCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 210,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            height: 140,
            width: 130,
            image: NetworkImage('https://via.placeholder.com/150x300'),
            placeholder: AssetImage("assets/images/gray_background.jpg"),
            fadeInDuration: Duration(milliseconds: 300),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Name asd afasfdas asfafs asdasd",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
