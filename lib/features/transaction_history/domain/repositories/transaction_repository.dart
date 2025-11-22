import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionHistoryEntity>>> getTransactions({
    required int page,
    required int pageSize,
    String? typeFilter,
  });
}
