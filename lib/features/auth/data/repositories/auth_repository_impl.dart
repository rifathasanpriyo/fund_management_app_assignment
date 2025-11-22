import 'package:dartz/dartz.dart';
import '../../../../core/local_database/auth_db.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/fake_auth_data_source.dart';
import '../../../../core/errors/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FakeAuthDataSource dataSource;
  final SessionManager session;

  AuthRepositoryImpl(this.dataSource, this.session);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      final isValid = await dataSource.login(email, password);

      if (isValid) {
        await session.saveToken("dummy_login_token");
        return Right(true);
      } else {
        return Left(ServerFailure("Invalid email or password"));
      }
    } catch (e) {
      return Left(ServerFailure("Login failed: ${e.toString()}"));
    }
  }
}
