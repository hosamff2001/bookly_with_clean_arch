part of 'newset_books_cubit.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

class NewsetBooksInitial extends NewsetBooksState {}

class NewsetBooksLoading extends NewsetBooksState {}


class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookEntity> books;

  const NewsetBooksSuccess(this.books);
}


class NewsetBooksError extends NewsetBooksState {
  final String erromessage;

  const NewsetBooksError(this.erromessage);
}




