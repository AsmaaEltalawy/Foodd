import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsApp/services/repository.dart';
import 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final Repository repository;

  ArticleCubit(this.repository) : super(ArticleInitial());

  void fetchArticles() async {
    try {
      emit(ArticleLoading());
      final articles = await repository.getArticle();
      emit(ArticleLoaded(articles));
    } catch (e) {
      emit(ArticleError("Failed to fetch articles"));
    }
  }
}
