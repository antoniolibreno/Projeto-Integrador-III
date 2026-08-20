import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/bloc/app_bloc_observer.dart';
import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  configureDependencies();
  runApp(const NatyApp(
    config: AppConfig.development,
    router: AppRouter(),
  ));
}
