import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/fund_entity.dart';
import '../../domain/repositories/fund_repository.dart';
import '../data_sources/fake_fund_data_source.dart';
import '../models/fund_model.dart';

class FundRepositoryImpl implements FundRepository {
  final FakeFundDataSource dataSource;

  FundRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, FundEntity>> getFundData() async {
    try {
      final json = await dataSource.getFundData();
      return Right(FundModel.fromJson(json));
    } catch (e) {
      return Left(ServerFailure("Failed to load fund details"));
    }
  }
}
