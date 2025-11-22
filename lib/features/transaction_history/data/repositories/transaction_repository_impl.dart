import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/fake_transaction_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final FakeTransactionDataSource dataSource;

  TransactionRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<TransactionHistoryEntity>>> getTransactions({
    required int page,
    required int pageSize,
    String? typeFilter,
  }) async {
    try {
      final result = await dataSource.getTransactions(
        page: page,
        pageSize: pageSize,
        typeFilter: typeFilter,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("Failed to load transactions"));
    }
  }
}
