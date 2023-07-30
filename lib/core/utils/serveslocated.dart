import 'package:bookly_with_clean_arch/Features/home/data/data_source/local_data_source.dart';
import 'package:bookly_with_clean_arch/Features/home/data/data_source/remote_data_source.dart';
import 'package:bookly_with_clean_arch/Features/home/data/repo/home_rebo_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImple>(HomeRepoImple(
      homeLocalDataSource: HomeLocalDataSourceimpl(),
      homeRemoteDataSource: HomeRemoteDataSourceimpl()));
}
