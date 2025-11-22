import 'package:dartz/dartz.dart';
import '../entities/transaction_entity.dart';
import '../repositories/transaction_repository.dart';
import '../../../../core/errors/failures.dart';

class GetTransactionsUseCase {
  final TransactionRepository repository;

  GetTransactionsUseCase(this.repository);

  Future<Either<Failure, List<TransactionHistoryEntity>>> call({
    required int page,
    required int pageSize,
    String? typeFilter,
  }) {
    return repository.getTransactions(
      page: page,
      pageSize: pageSize,
      typeFilter: typeFilter,
    );
  }
}
