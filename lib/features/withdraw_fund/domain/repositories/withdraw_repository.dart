import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/withdraw_entity.dart';

abstract class WithdrawRepository {
  Future<Either<Failure, void>> withdraw(WithdrawEntity withdraw);
}

