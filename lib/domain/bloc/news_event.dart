part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsLoadEvent extends NewsEvent {
  const NewsLoadEvent();
}

class GoNewsEvent extends NewsEvent {
  final String url;
  const GoNewsEvent({required this.url});
  @override
  List<Object> get props => [url];
}

class ChangeLangEvent extends NewsEvent {
  final String lang;
  final BuildContext context;
  const ChangeLangEvent({required this.lang, required this.context});
  @override
  List<Object> get props => [lang, context];
}
