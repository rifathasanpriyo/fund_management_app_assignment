import '../models/transaction_model.dart';

class FakeTransactionDataSource {
  Future<List<TransactionModel>> getTransactions({
    required int page,
    required int pageSize,
    String? typeFilter,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    // fake total transactions
    final allTransactions = List.generate(
      50,
      (index) => TransactionModel(
        id: "$index",
        type: index % 3 == 0
            ? "Deposit"
            : index % 3 == 1
                ? "Withdraw"
                : "Transfer",
        title: "Transaction $index",
        date: "2025-11-${(index % 30) + 1}",
        amount: (index + 1) * 10.0,
      ),
    );

    List<TransactionModel> filtered = allTransactions;
    if (typeFilter != null && typeFilter.isNotEmpty) {
      filtered = allTransactions.where((t) => t.type == typeFilter).toList();
    }

    // pagination
    final start = (page - 1) * pageSize;
    final end = start + pageSize;
    if (start >= filtered.length) return [];
    return filtered.sublist(start, end > filtered.length ? filtered.length : end);
  }
}
