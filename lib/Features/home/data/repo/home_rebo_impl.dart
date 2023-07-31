import 'package:bookly_with_clean_arch/Features/home/data/data_source/local_data_source.dart';
import 'package:bookly_with_clean_arch/Features/home/data/data_source/remote_data_source.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/rebo/home_rebo.dart';
import 'package:bookly_with_clean_arch/core/error/failers.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImple(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Faillure, List<BookEntity>>> fetchfuaturebooks({int pagenumber=0}) async {
    try {
      List<BookEntity> books = homeLocalDataSource.fetchfutherdBooks(pagenumber: pagenumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchfutherdBooks(pagenumber: pagenumber);
      return right(books);
    } catch (e) {
     
      if (e is DioException) {
        left(ServerFailure.fromDioError(e));
      }
      return left(
          ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faillure, List<BookEntity>>> fetchnewsetebooks() async {
    try {
      List<BookEntity> books = homeLocalDataSource.fetchnewsetBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchnewsetBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        left(ServerFailure.fromDioError(e));
      }
      return left(
          ServerFailure("oops ,There error ocured , please try agine later "));
    }
  }
}
