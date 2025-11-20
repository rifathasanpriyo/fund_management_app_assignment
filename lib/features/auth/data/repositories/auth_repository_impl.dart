import '../../../../core/local_database/auth_db.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/fake_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FakeAuthDataSource dataSource;
  final SessionManager session;

  AuthRepositoryImpl(this.dataSource, this.session);

  @override
  Future<bool> login(String email, String password) async {
    final isValid = await dataSource.login(email, password);

    if (isValid) {
      await session.saveToken("dummy_login_token");
      return true;
    }

    return false;
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await session.getToken();
    return token != null;
  }

  @override
  Future<void> logout() async {
    await session.clearSession();
  }
}
