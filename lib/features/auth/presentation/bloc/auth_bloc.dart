import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../../../core/errors/failures.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());

      final Either<Failure, bool> result =
          await loginUseCase.call(event.email, event.password);

      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (success) => emit(success ? AuthAuthenticated() : AuthError("Login failed")),
      );
    });
  }
}
