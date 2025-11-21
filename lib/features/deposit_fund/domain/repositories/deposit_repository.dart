import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class DepositRepository {
  Future<Either<Failure, bool>> deposit(double amount);
}
