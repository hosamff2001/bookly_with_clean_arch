
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/home/domain/entities/book_entity.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/dio.dart';
import 'core/utils/serveslocated.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  DioHelper.init();
    await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kHiveBooks);
  await Hive.openBox<BookEntity>(kHiveBooksnewset);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
