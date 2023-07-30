import 'package:bloc/bloc.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/use_case/fetch_newset_books.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/book_entity.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.newsetBooksUseCase) : super(NewsetBooksInitial());
   
    final FetchNewsetBooksUseCase newsetBooksUseCase;

  Future<void> fetchnewsetbooks() async {
    emit(NewsetBooksLoading());
    var result = await newsetBooksUseCase.execute();
    result.fold((faillure) {
      emit(NewsetBooksError(faillure.errormessage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
