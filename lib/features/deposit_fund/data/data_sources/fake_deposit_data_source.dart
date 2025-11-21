class FakeDepositDataSource {
  Future<bool> deposit(double amount) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; 
  }
}
