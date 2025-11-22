import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionHistoryEntity {
  TransactionModel({
    required super.id,
    required super.type,
    required super.title,
    required super.date,
    required super.amount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      date: json['date'],
      amount: json['amount'].toDouble(),
    );
  }
}

