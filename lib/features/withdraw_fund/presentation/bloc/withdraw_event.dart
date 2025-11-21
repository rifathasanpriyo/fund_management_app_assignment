abstract class WithdrawEvent {}

class PerformWithdrawEvent extends WithdrawEvent {
  final double amount;
  final String bankAccount;

  PerformWithdrawEvent({required this.amount, required this.bankAccount});
}