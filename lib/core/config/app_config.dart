/// Configurações do ambiente da aplicação.
class AppConfig {
  const AppConfig({required this.appName, required this.baseUrl});

  final String appName;
  final String baseUrl;

  static const development = AppConfig(
    appName: 'NatyApp',
    baseUrl: 'https://api.example.com',
  );
}
