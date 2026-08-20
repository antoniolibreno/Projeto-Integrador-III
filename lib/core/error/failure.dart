/// Erro de domínio que pode ser apresentado ou tratado pela aplicação.
sealed class Failure implements Exception {
  const Failure(this.message);

  final String message;
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Ocorreu um erro inesperado.']);
}

final class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Não foi possível conectar ao servidor.',
  ]);
}

