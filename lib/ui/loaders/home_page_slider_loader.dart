import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageSliderLoader extends StatelessWidget {
  const HomePageSliderLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, i, rI) => Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade300,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      itemCount: 10,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        height: 200,
      ),
    );
    ;
  }
}
