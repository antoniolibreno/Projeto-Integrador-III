import 'package:injectable/injectable.dart';

import '../config/app_config.dart';

/// Ponto de entrada para chamadas HTTP. Os métodos serão adicionados por
/// feature; a camada de infraestrutura fica isolada do restante do app.
@lazySingleton
class ApiClient {
  ApiClient(this.config);

  final AppConfig config;
}
