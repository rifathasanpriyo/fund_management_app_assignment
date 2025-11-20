import '../repositories/auth_repository.dart';

class CheckLoginStatusUseCase {
  final AuthRepository repo;

  CheckLoginStatusUseCase(this.repo);

  Future<bool> call() {
    return repo.isLoggedIn();
  }
}
