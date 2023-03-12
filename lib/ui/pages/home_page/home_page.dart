import 'package:flutter/material.dart';
import 'package:news_app1/ui/widgets/all_news_list/all_news_list.dart';
import 'package:news_app1/ui/widgets/home_page_app_bar/home_page_app_bar.dart';
import 'package:news_app1/ui/widgets/home_page_slider/home_page_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const HomePageAppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                children: const <Widget>[
                  HomePageSlider(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Все новости',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color.fromARGB(255, 97, 104, 238),
                      ),
                    ),
                  ),
                  AllNewsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
