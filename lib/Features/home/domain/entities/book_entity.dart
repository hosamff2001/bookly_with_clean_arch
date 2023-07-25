class BookEntity {
  final String imageurl;
  final String namen;
  final String authorname;
  final num price;
  final num rating;
  final num ratingcount;

  BookEntity({
    required this.namen,
    required this.authorname,
    required this.price,
    required this.rating,
    required this.ratingcount,
    required this.imageurl,
  });
}
