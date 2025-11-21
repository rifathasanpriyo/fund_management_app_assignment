import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../data_sourecs/fake_dashboard_data_source.dart';
import '../models/dashboard_response_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final FakeDashboardDataSource dataSource;

  DashboardRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, DashboardEntity>> getDashboardData() async {
    try {
      final json = await dataSource.getDashboardData();
      final data = DashboardModel.fromJson(json);

      return Right(data); 
    } catch (e) {
      return Left(ServerFailure("Failed to load dashboard data"));
    }
  }
}
