import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  AppConfig get appConfig => AppConfig.development;
}
