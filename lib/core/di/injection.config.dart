// GENERATED CODE - kept in the repository so the app can run before the
// optional injectable generator is executed.
// ignore_for_file: unnecessary_lambdas

import 'package:get_it/get_it.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../config/app_config.dart';
import '../network/api_client.dart';

extension GetItInjectableX on GetIt {
  GetIt init() {
    registerSingleton<AppConfig>(AppConfig.development);
    registerLazySingleton<ApiClient>(() => ApiClient(this<AppConfig>()));
    registerFactory<HomeBloc>(HomeBloc.new);
    return this;
  }
}
