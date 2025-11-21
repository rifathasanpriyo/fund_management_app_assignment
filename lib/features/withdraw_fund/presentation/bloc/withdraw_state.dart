abstract class WithdrawState {}

class WithdrawInitial extends WithdrawState {}

class WithdrawLoading extends WithdrawState {}

class WithdrawSuccess extends WithdrawState {
  final double amount;
  WithdrawSuccess(this.amount);
}

class WithdrawError extends WithdrawState {
  final String message;
  WithdrawError(this.message);
}