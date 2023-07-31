import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/featured_books/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return  FeaturedBooksListView(books: state.books);
        } else if (state is FeaturedBooksError) {
          return Center(child: Text(state.erromessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}