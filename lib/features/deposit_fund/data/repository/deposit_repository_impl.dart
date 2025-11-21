import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/deposit_repository.dart';
import '../data_sources/fake_deposit_data_source.dart';

class DepositRepositoryImpl implements DepositRepository {
  final FakeDepositDataSource dataSource;

  DepositRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, bool>> deposit(double amount) async {
    try {
      final success = await dataSource.deposit(amount);
      return Right(success);
    } catch (e) {
      return Left(ServerFailure("Deposit failed: $e"));
    }
  }
}
