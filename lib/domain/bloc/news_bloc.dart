import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsInitial()) {
    on<NewsLoadEvent>(_loadAllNews);
    on<GoNewsEvent>(_goNews);
    on<ChangeLangEvent>(_changeLang);
  }

  Future<void> _loadAllNews(
    NewsLoadEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final lang = pref.getString('lang') ?? 'ru';
      Uri url = Uri.parse('https://uzreport.news/feed/rss/$lang');
      final response = await http.get(url);
      final data = RssFeed.parse(response.body);
      emit(NewsLoaded(allNews: data));
    } catch (e) {
      e;
    }
  }

  Future<void> _goNews(
    GoNewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      await launchUrlString(event.url);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _changeLang(
    ChangeLangEvent event,
    Emitter<NewsState> emit,
  ) async {
    try {
      final lang = event.lang;
      event.context.setLocale(Locale(event.lang));
      final pref = await SharedPreferences.getInstance();
      pref.setString('lang', event.lang);
      Uri url = Uri.parse('https://uzreport.news/feed/rss/$lang');
      final response = await http.get(url);
      final data = RssFeed.parse(response.body);
      emit(NewsLoaded(allNews: data));
    } catch (e) {
      e;
    }
  }
}
