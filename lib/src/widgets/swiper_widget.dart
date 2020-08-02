import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {

  final List<dynamic> jugos;

  SwiperWidget(  { @required this.jugos} );

  @override
  Widget build(BuildContext context) {

    final size  = MediaQuery.of(context).size;
    return Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(jugos[index]['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect( // make sure we apply clip it properly
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey.withOpacity(0.1),
                    child: Text(
                      jugos[index]['nombre'],
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            )
          );
        },
        itemCount: jugos.length,
        itemWidth: size.width * 0.80,
        itemHeight: size.height * 0.50,
        layout: SwiperLayout.STACK,
      );
  }
}