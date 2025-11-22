abstract class TransactionEvent {}

class LoadTransactionsEvent extends TransactionEvent {
  final bool isRefresh;
  final String? typeFilter;
  

  LoadTransactionsEvent({this.isRefresh = false, this.typeFilter});
}