import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/deposit_repository.dart';

class DepositUseCase {
  final DepositRepository repository;
  DepositUseCase(this.repository);

  Future<Either<Failure, bool>> call(double amount) async {
    return await repository.deposit(amount);
  }
}
