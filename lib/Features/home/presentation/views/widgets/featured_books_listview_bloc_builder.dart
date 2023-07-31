import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manger/featured_books/featured_books_cubit.dart';
import 'featured_list_view.dart';
import 'image_loading.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksErrorPagination) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                
                content: Text(state.erromessage,style: TextStyle(color: Colors.white),),));
        }

      },
      builder: (context, state) {
       
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksLoadingPagination|| state is FeaturedBooksErrorPagination) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksError) {
          return Center(child: Text(state.erromessage));
        } else {
          return const FeatchedImageLoading();
        }
      },
    );
  }
}
