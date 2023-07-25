import 'package:dartz/dartz.dart';

import '../error/failers.dart';

abstract class UseCaseP<type,parmet> {
  Future<Either<Faillure, type>> execute(parmet parmeter);
  
}
