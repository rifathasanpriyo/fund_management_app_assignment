import 'package:dartz/dartz.dart';
import '../entities/dashboard_entity.dart';
import '../repositories/dashboard_repository.dart';
import '../../../../core/errors/failures.dart';

class GetDashboardDataUseCase {
  final DashboardRepository repository;

  GetDashboardDataUseCase(this.repository);

  Future<Either<Failure, DashboardEntity>> call() {
    return repository.getDashboardData();
  }
}
