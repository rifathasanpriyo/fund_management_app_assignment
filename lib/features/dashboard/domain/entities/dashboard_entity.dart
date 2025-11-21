class DashboardEntity {
   double currentBalance;
   double availableBalance;
   List<TransactionEntity> transactions;

  DashboardEntity({
    required this.currentBalance,
    required this.availableBalance,
    required this.transactions,
  });
}

class TransactionEntity {
  final String title;
  final String date;
  final double amount;

  TransactionEntity({
    required this.title,
    required this.date,
    required this.amount,
  });
}
