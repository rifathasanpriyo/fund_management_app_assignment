class FakeFundDataSource {
  Future<Map<String, dynamic>> getFundData() async {
    await Future.delayed(const Duration(seconds: 1));

    return {
      "currentBalance": 12000.0,
      "investedAmount": 10000.0,
      "profit": 2000.0,
      "performanceData": [2, 3, 5, 6, 9, 7, 10, 12, 11],
    };
  }
}
