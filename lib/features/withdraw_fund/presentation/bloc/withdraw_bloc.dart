

import 'package:flutter_application_1/features/withdraw_fund/presentation/bloc/withdraw_event.dart';
import 'package:flutter_application_1/features/withdraw_fund/presentation/bloc/withdraw_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/withdraw_entity.dart';
import '../../domain/usecases/withdraw_usecase.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  final WithdrawUseCase withdrawUseCase;

  WithdrawBloc(this.withdrawUseCase) : super(WithdrawInitial()) {
    on<PerformWithdrawEvent>(_onWithdraw);
  }

  Future<void> _onWithdraw(
      PerformWithdrawEvent event, Emitter<WithdrawState> emit) async {
    emit(WithdrawLoading());

    final result = await withdrawUseCase(WithdrawEntity(
      amount: event.amount,
      bankAccount: event.bankAccount,
    ));

    result.fold(
      (failure) => emit(WithdrawError(failure.message)),
      (_) => emit(WithdrawSuccess(event.amount)),
    );
  }
}