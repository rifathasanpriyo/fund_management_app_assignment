import '../models/withdraw_request_model.dart';

class FakeWithdrawDataSource {
  Future<void> withdraw(WithdrawModel withdraw) async {
    await Future.delayed(Duration(seconds: 2));
    // simulate always success
    return;
  }
}
