import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchfutherdBooks();
  List<BookEntity> fetchnewsetBooks();
}

class HomeLocalDataSourceimpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchfutherdBooks() {
    // TODO: implement fetchfutherdBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchnewsetBooks() {
    // TODO: implement fetchnewsetBooks
    throw UnimplementedError();
  }
}