import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/dashboard_entity.dart';

class RecentTransactionsListCardWidgets extends StatelessWidget {
  final TransactionEntity tx;
  const RecentTransactionsListCardWidgets({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.blue,
          child: Icon(Icons.monetization_on, color: Colors.white),
        ),
        title: Text(tx.title),
        subtitle: Text(tx.date),
        trailing: Text(
          tx.amount.toStringAsFixed(2),
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
