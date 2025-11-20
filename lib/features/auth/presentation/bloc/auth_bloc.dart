import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/auth_state.dart';

import '../../domain/usecases/check_login_status.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final CheckLoginStatusUseCase checkLoginStatusUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.checkLoginStatusUseCase,
  }) : super(AuthInitial()) {

    // Check if user already logged in
    on<AuthCheckStatus>((event, emit) async {
      final logged = await checkLoginStatusUseCase();
      if (logged) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    });

    // Handle Login
    on<AuthLoginRequested>((event, emit) async {
 emit(AuthLoading());

  try {
    final isSuccess = await loginUseCase.call(event.email, event.password);

    if (isSuccess) {
      emit(AuthAuthenticated());
    } else {
      emit( AuthError("Invalid email or password"));
    }
  } catch (e) {
    emit(AuthError(e.toString()));
  }
    });

  }
}
