import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/constants/app_sizes.dart';

class BalanceCardWidget extends StatelessWidget {
  final String title;
  final double amount;
  const BalanceCardWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, color: AppColors.subtitle),
              ),
              SizedBox(height: AppSizes.insidePadding),
              Text(
                "\$${amount.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
