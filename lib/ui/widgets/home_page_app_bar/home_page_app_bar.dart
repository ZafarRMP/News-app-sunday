import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/domain/bloc/news_bloc.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);
    return Container(
      alignment: Alignment.center,
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(0, 0, 0, .3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            tr('title'),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 97, 104, 238),
            ),
          ),
          IconButton(
              onPressed: () {
                bloc.add(ChangeLangEvent(lang: 'ru', context: context));
              },
              icon: const Text('RU')),
          IconButton(
              onPressed: () {
                bloc.add(ChangeLangEvent(lang: 'en', context: context));
              },
              icon: const Text('EN')),
          IconButton(
              onPressed: () {
                bloc.add(ChangeLangEvent(lang: 'uz', context: context));
              },
              icon: const Text('UZ')),
        ],
      ),
    );
  }
}
