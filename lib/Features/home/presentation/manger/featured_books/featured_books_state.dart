part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksLoadingPagination extends FeaturedBooksState {}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  const FeaturedBooksSuccess(this.books);
}

class FeaturedBooksError extends FeaturedBooksState {
  final String erromessage;

  const FeaturedBooksError(this.erromessage);
}
class FeaturedBooksErrorPagination extends FeaturedBooksState {
  final String erromessage;

  const FeaturedBooksErrorPagination(this.erromessage);
}
