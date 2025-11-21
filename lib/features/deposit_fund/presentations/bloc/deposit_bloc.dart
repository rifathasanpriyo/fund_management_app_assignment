import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/deposit_usecase.dart';
import 'deposit_event.dart';
import 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final DepositUseCase depositUseCase;

  DepositBloc(this.depositUseCase) : super(DepositInitial()) {
    on<MakeDepositEvent>(_makeDeposit);
  }

  Future<void> _makeDeposit(
      MakeDepositEvent event, Emitter<DepositState> emit) async {
    emit(DepositLoading());

    final result = await depositUseCase(event.amount);

    result.fold(
      (failure) => emit(DepositError(failure.message)),
      (success) => emit(DepositSuccess()),
    );
  }
}
