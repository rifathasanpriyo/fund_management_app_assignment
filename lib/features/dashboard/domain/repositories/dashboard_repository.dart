import 'package:dartz/dartz.dart';
import '../entities/dashboard_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardEntity>> getDashboardData();
}
