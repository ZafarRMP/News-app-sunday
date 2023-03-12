import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/domain/bloc/news_bloc.dart';
import 'package:news_app1/ui/loaders/home_page_slider_loader.dart';

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is! NewsLoaded) {
          return const HomePageSliderLoader();
        }
        final allNews = state.allNews.items;
        return CarouselSlider.builder(
          itemBuilder: (context, i, rI) => SliderItem(
            newsItem: allNews[i],
          ),
          itemCount: allNews.length,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            height: 200,
          ),
        );
      },
    );
  }
}

class SliderItem extends StatelessWidget {
  final RssItem newsItem;
  const SliderItem({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: newsItem.enclosure!.url!,
          progressIndicatorBuilder: (context, url, progress) => const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
}
