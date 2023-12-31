import 'package:bookly_with_clean_arch/Features/home/data/repo/home_rebo_impl.dart';
import 'package:bookly_with_clean_arch/Features/home/domain/use_case/fetch_newset_books.dart';
import 'package:bookly_with_clean_arch/Features/home/presentation/manger/newset_books/newset_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use_case/fatch_feature_books.dart';
import 'Features/home/presentation/manger/featured_books/featured_books_cubit.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/dio.dart';
import 'core/utils/serveslocated.dart';
import 'core/utils/simpleblocobserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  DioHelper.init();
  Bloc.observer = SimpleBlocObserver();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
          create: (context) => FeaturedBooksCubit(
              FetchFeatureBooksUseCase(getIt.get<HomeRepoImple>()))..fetchfeaturebooks()
            ,
        ),
        BlocProvider<NewsetBooksCubit>(
          create: (context) => NewsetBooksCubit(
              FetchNewsetBooksUseCase(getIt.get<HomeRepoImple>()))
            ..fetchnewsetbooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
