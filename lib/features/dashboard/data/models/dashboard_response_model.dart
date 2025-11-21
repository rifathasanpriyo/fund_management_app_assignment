
import '../../domain/entities/dashboard_entity.dart';

class DashboardModel extends DashboardEntity {
  DashboardModel({
    required super.currentBalance,
    required super.availableBalance,
    required super.transactions,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      currentBalance: json["currentBalance"],
      availableBalance: json["availableBalance"],
      transactions: List<TransactionEntity>.from(
        json["transactions"].map(
          (t) => TransactionEntity(
            title: t["title"],
            date: t["date"],
            amount: t["amount"].toDouble(),
          ),
        ),
      ),
    );
  }
}
