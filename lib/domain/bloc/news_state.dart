part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoaded extends NewsState {
  final RssFeed allNews;
  const NewsLoaded({required this.allNews});

  @override
  List<Object> get props => [allNews];
}
