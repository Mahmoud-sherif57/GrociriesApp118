
abstract class AuthState {}

final class InitialAuthState extends AuthState{}

final class LogIngLoadingState extends AuthState{}

final class LogIngSuccessfulState extends AuthState{}

final class LogIngErrorState extends AuthState{}

final class TogglePasswordState extends AuthState{}

