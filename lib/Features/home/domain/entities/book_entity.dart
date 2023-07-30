import 'package:hive/hive.dart';

part 'book_entity.g.dart';


@HiveType(typeId: 0)
class BookEntity {
@HiveField(0)
  final String bookid;
@HiveField(1)
  final String? imageurl;
@HiveField(2)
  final String title;
@HiveField(3)
  final String authorname;
@HiveField(4)
  final num price;
@HiveField(5)
  final num? rating;
  @HiveField(6)
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
