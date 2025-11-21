import 'package:dartz/dartz.dart';
import '../entities/fund_entity.dart';
import '../repositories/fund_repository.dart';
import '../../../../core/errors/failures.dart';

class GetFundDetailsUseCase {
  final FundRepository repository;

  GetFundDetailsUseCase(this.repository);

  Future<Either<Failure, FundEntity>> call() {
    return repository.getFundData();
  }
}
