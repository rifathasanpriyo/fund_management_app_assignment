import '../../domain/entities/fund_entity.dart';

class FundModel extends FundEntity {
  FundModel({
    required super.currentBalance,
    required super.investedAmount,
    required super.profit,
    required super.performanceData,
  });

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(
      currentBalance: json["currentBalance"],
      investedAmount: json["investedAmount"],
      profit: json["profit"],
      performanceData:
          List<double>.from(json["performanceData"].map((e) => e.toDouble())),
    );
  }
}
