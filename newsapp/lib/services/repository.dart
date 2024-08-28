import 'package:dio/dio.dart';
import 'package:newsApp/services/article_model.dart';

class Repository {
  final Dio dio = Dio();

  Future<List<ArticleModel>> getArticle() async {
    try {
      String url =
          'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=77ac4ef9a8194131adedb8e4ab7345e1';
      final response = await dio.get(url);

      List articlesJson = response.data['articles'];

      return articlesJson.map((json) => ArticleModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
