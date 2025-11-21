import 'package:dartz/dartz.dart';
import '../entities/fund_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class FundRepository {
  Future<Either<Failure, FundEntity>> getFundData();
}
