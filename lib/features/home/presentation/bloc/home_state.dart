sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeReady extends HomeState {
  const HomeReady();
}

final class HomeFailure extends HomeState {
  const HomeFailure(this.message);

  final String message;
}
