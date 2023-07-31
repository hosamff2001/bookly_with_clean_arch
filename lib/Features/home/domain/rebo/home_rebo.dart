
import 'package:dartz/dartz.dart';

import '../../../../core/error/failers.dart';
import '../entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Faillure, List<BookEntity>>> fetchfuaturebooks({int pagenumber=0});
  Future<Either<Faillure, List<BookEntity>>> fetchnewsetebooks();
}
