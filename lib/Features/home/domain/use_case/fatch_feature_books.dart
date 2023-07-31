import 'package:dartz/dartz.dart';

import '../../../../core/error/failers.dart';
import '../../../../core/use_case/use_case_with_parmeter.dart';
import '../entities/book_entity.dart';
import '../rebo/home_rebo.dart';

class FetchFeatureBooksUseCase extends UseCaseP<List<BookEntity>,int> {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Faillure, List<BookEntity>>> execute(int parmeter) async{
    return await homeRepo.fetchfuaturebooks(pagenumber: parmeter);
  }
}
