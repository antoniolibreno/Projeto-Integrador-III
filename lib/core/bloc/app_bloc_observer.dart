import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Ponto central para observabilidade e tratamento de erros dos BLoCs.
class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('BLoC ${bloc.runtimeType} falhou: $error');
    super.onError(bloc, error, stackTrace);
  }
}
