import 'package:bibliotheque/app/main/models/book.dart';
import 'package:bibliotheque/app/main/models/offers_response.dart';
import 'package:bibliotheque/config/api-urls/api_urls.dart';
import 'package:bibliotheque/config/interceptor/interceptor.dart';
import 'package:dio/dio.dart';

class BooksServices {

  /// FETCH LIST OF BOOKS
  Future<List<Book>?> getBooks() {
    return DioInterceptor.dio!
        .get(ApiUrls.books)
        .then((Response response) {
      if (response.statusCode == 200) {
        return List<Book>.from(response.data.map((x) => Book.fromJson(x)));
      } else {
        return null;
      }
    });
  }
}