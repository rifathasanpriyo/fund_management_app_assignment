class FundEntity {
  final double currentBalance;
  final double investedAmount;
  final double profit;
  final List<double> performanceData;

  FundEntity({
    required this.currentBalance,
    required this.investedAmount,
    required this.profit,
    required this.performanceData,
  });
}
