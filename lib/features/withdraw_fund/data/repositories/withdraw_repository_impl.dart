import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/withdraw_entity.dart';
import '../../domain/repositories/withdraw_repository.dart';
import '../data_sources/fake_withdraw_data_source.dart';
import '../models/withdraw_request_model.dart';

class WithdrawRepositoryImpl implements WithdrawRepository {
  final FakeWithdrawDataSource dataSource;

  WithdrawRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, void>> withdraw(WithdrawEntity withdraw) async {
    try {
      final model = WithdrawModel(
        amount: withdraw.amount,
        bankAccount: withdraw.bankAccount,
      );
      await dataSource.withdraw(model);
      return Right(null); 
    } catch (e) {
      return Left(ServerFailure("Failed to withdraw"));
    }
  }
}
