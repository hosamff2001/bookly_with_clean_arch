import 'package:hive_flutter/hive_flutter.dart';

import '../../Features/home/domain/entities/book_entity.dart';

void savedatatohive(List<BookEntity> data, String boxname) {
  var box = Hive.box<BookEntity>(boxname);
  box.addAll(data);
}
