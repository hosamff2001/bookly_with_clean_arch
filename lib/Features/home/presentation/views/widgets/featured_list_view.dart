import 'package:bookly_with_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/featured_books/featured_books_cubit.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;
  int pagenumber = 1;
  bool isloading = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollerpagination);
    super.initState();
  }

  void _scrollerpagination() async {
    var maxscroll = _scrollController.position.maxScrollExtent;
    var currentscroll = _scrollController.position.pixels;
    if (maxscroll * 0.7 <= currentscroll) {
      if (!isloading) {
        isloading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchfeaturebooks(pagenumber: pagenumber++);
        isloading = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(
                imageUrl: widget.books[index].imageurl ?? "",
              ),
            );
          }),
    );
  }
}
