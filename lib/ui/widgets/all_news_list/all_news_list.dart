import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/domain/bloc/news_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllNewsList extends StatelessWidget {
  const AllNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is! NewsLoaded) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        final allNews = state.allNews.items;
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => AllNewsItem(
            item: allNews[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: allNews.length,
        );
      },
    );
  }
}

class AllNewsItem extends StatelessWidget {
  final RssItem item;
  const AllNewsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);
    return ZoomTapAnimation(
      beginCurve: Curves.linear,
      endDuration: const Duration(milliseconds: 200),
      onLongTap: () {
        bloc.add(GoNewsEvent(url: item.link!));
      },
      child: Container(
        height: 320,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://klike.net/uploads/posts/2019-05/1556708032_1.jpg',
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
            const AllNewsText(),
          ],
        ),
      ),
    );
  }
}

class AllNewsText extends StatelessWidget {
  const AllNewsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'data',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'сем доброго утра! Как ваши дела, как настроение? У меня все отлично, а вы напишите ответ и обязательно зацените курс',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            'ходимое есть в этом кур',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
