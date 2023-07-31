import 'package:bookly_with_clean_arch/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchfutherdBooks({int pagenumber=0});
  List<BookEntity> fetchnewsetBooks();
}

class HomeLocalDataSourceimpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchfutherdBooks({int pagenumber=0}) {
    var books = Hive.box<BookEntity>(kHiveBooks);

    if (pagenumber*10>books.length) {
      return [];
    }
    return books.values.toList().sublist(pagenumber*10);
  }

  @override
  List<BookEntity> fetchnewsetBooks() {
    var books = Hive.box<BookEntity>(kHiveBooksnewset);
    return books.values.toList();
  }
}
