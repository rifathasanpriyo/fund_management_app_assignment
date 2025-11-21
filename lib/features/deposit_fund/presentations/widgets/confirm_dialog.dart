import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../bloc/deposit_bloc.dart';
import '../bloc/deposit_event.dart';

class ConfirmDialog extends StatelessWidget {
  final String amount;
  const ConfirmDialog({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.blue,
                size: 40,
              ),
            ),

            const SizedBox(height: AppSizes.bodyPadding),

            // Title
            const Text(
              "Confirm Your Deposit",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: AppSizes.bodyPadding),

            // Amount Label
            const Text(
              "Amount",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 5),

            // Amount Value
            Text(
              "\$$amount",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
            ),

            const SizedBox(height: 15),

            // Description
            const Text(
              "This amount will be transferred from your linked bank account.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const SizedBox(height: AppSizes.bodyPadding),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  final finalAmount = double.tryParse(amount) ?? 0;

    context.read<DepositBloc>().add(MakeDepositEvent(finalAmount));
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    color: AppColors.white,
                    // fontSize: 18,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Cancel
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
