abstract class AuthState {}

final class InitialAuthState extends AuthState {}

final class LoggingLoadingState extends AuthState {}

final class LoggingSuccessfulState extends AuthState {}

final class LoggingErrorState extends AuthState {
  // we create contractor to emit the error message inside to the user .
  final String message;
  LoggingErrorState(this.message);
}

final class TogglePasswordState extends AuthState {}
