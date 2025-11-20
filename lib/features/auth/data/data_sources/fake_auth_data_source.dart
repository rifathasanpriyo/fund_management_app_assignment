class FakeAuthDataSource {
  Future<bool> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email == "test@gmail.com" && password == "123456") {
        return true;
      } else {
        throw Exception("Invalid email or password");
      }
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}
