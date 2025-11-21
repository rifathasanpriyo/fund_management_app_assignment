class FakeDashboardDataSource {
  Future<Map<String, dynamic>> getDashboardData() async {
    await Future.delayed(Duration(seconds: 1));

    return {
      "currentBalance": 12000.0,
      "availableBalance": 9500.0,
      "transactions": List.generate(
        10,
        (i) => {
          "title": "Transaction ${i + 1}",
          "date": "2025-11-${20 - i}",
          "amount": (i + 1) * 50,
        },
      )
    };
  }
}
