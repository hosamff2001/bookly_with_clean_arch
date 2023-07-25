import 'package:dartz/dartz.dart';

import '../error/failers.dart';

abstract class UseCaseNP<type> {
  Future<Either<Faillure, type>> execute( );
  
}
