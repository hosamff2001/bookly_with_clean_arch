
import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/use_case/fatch_feature_books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featureBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeatureBooksUseCase featureBooksUseCase;

  Future<void> fetchfeaturebooks({int pagenumber=0}) async {
    emit(FeaturedBooksLoading());
    var result = await featureBooksUseCase.execute(pagenumber);
    result.fold((faillure) {
      emit(FeaturedBooksError(faillure.errormessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
