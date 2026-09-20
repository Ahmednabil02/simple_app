import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/core/networking/dio_factory.dart';
import 'package:task_app/feature/register/data/repo/register_repo.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
}
