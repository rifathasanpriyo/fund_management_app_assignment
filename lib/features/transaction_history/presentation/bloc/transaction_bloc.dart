import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionsUseCase useCase;
  int page = 1;
  final int pageSize = 10;
  bool isFetching = false;
  List<TransactionHistoryEntity> allTransactions = [];

  TransactionBloc(this.useCase) : super(TransactionInitial()) {
    on<LoadTransactionsEvent>(_onLoadTransactions);
  }

  Future<void> _onLoadTransactions(
      LoadTransactionsEvent event, Emitter<TransactionState> emit) async {
    if (isFetching) return;
    isFetching = true;

    if (event.isRefresh) {
      page = 1;
      allTransactions.clear();
    }

    if (page == 1) emit(TransactionLoading());

    final result = await useCase(
      page: page,
      pageSize: pageSize,
      typeFilter: event.typeFilter,
    );

    result.fold(
      (failure) {
        emit(TransactionError(failure.message));
      },
      (transactions) {
        allTransactions.addAll(transactions);
        emit(TransactionLoaded(allTransactions, transactions.length == pageSize));
        page++;
      },
    );

    isFetching = false;
  }
}