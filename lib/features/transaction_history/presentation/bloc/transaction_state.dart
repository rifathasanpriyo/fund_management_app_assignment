import '../../domain/entities/transaction_entity.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionHistoryEntity> transactions;
  final bool hasMore;

  TransactionLoaded(this.transactions, this.hasMore);
}

class TransactionError extends TransactionState {
  final String message;
  TransactionError(this.message);
}