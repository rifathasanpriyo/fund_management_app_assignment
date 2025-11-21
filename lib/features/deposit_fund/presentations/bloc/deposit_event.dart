abstract class DepositEvent {}

class MakeDepositEvent extends DepositEvent {
  final double amount;
  MakeDepositEvent(this.amount);
}
