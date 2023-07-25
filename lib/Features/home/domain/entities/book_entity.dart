class BookEntity {
  final String bookid;
  final String? imageurl;
  final String title;
  final String authorname;
  final num price;
  final num? rating;
  final num? ratingcount;

  BookEntity( {
    required this.bookid,
    required this.title,
    required this.authorname,
    required this.price,
    required this.rating,
    required this.ratingcount,
    required this.imageurl,
  });
}
