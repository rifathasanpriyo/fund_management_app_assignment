import 'package:dartz/dartz.dart';
import '../entities/withdraw_entity.dart';
import '../repositories/withdraw_repository.dart';
import '../../../../core/errors/failures.dart';

class WithdrawUseCase {
  final WithdrawRepository repository;

  WithdrawUseCase(this.repository);

  Future<Either<Failure, void>> call(WithdrawEntity withdraw) async {
    return await repository.withdraw(withdraw);
  }
}
