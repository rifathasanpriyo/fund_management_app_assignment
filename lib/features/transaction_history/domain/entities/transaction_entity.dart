class TransactionHistoryEntity {
  final String id;
  final String type;
  final String title;
  final String date;
  final double amount;

  TransactionHistoryEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.date,
    required this.amount,
  });
}
