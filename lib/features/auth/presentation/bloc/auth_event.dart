abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested(this.email, this.password);
}

class AuthCheckStatus extends AuthEvent {}

class AuthLogoutRequested extends AuthEvent {}
