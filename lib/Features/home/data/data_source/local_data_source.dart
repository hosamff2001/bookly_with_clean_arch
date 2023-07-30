import 'package:bookly_with_clean_arch/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchfutherdBooks();
  List<BookEntity> fetchnewsetBooks();
}

class HomeLocalDataSourceimpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchfutherdBooks() {
    var books = Hive.box<BookEntity>(kHiveBooks);
    return books.values.toList();
  }

  @override
  List<BookEntity> fetchnewsetBooks() {
    var books = Hive.box<BookEntity>(kHiveBooksnewset);
    return books.values.toList();
  }
}
