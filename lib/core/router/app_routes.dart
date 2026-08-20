enum AppRoute {
  home('/'),
  notFound('/not-found'),
  theo('/theo');
  const AppRoute(this.path);

  final String path;
}
