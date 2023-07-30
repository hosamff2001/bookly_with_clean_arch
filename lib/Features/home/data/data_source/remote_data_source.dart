import 'package:dio/dio.dart';

import '../../../../core/utils/dio.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchfutherdBooks();
  Future<List<BookEntity>> fetchnewsetBooks();
}

class HomeRemoteDataSourceimpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchfutherdBooks() async {
    var response = await DioHelper.get(url: "volumes", query: {
      
      "q": "programming",
      "Filtering": "free-ebooks",
      "subject": "flutter"
    });

    List<BookEntity> books = getbooksresponse(response);
    return books;
  }


  @override
  Future<List<BookEntity>> fetchnewsetBooks() async {
    var response = await DioHelper.get(url: "volumes", query: {
      "Sorting": "newest",
      "q": "programming",
      "Filtering": "free-ebooks",
      "subject": "programming"
    });

    List<BookEntity> books = getbooksresponse(response);
    return books;
  }
  List<BookEntity> getbooksresponse(Response<dynamic> response) {
     List<BookEntity> books = [];
    for (var item in response.data["items"]) {
      books.add(item);
    }
    return books;
  }
}