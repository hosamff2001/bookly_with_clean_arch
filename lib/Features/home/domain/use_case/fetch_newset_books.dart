import 'package:dartz/dartz.dart';

import '../../../../core/error/failers.dart';
import '../../../../core/use_case/use_case_witout_parmeter.dart';
import '../entities/book_entity.dart';
import '../rebo/home_rebo.dart';

class FetchNewsetBooksUseCase extends UseCaseNP<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchNewsetBooksUseCase(this.homeRepo);

  @override
  Future<Either<Faillure, List<BookEntity>>> execute() async{
    return await homeRepo.fetchnewsetebooks();
  }
}
