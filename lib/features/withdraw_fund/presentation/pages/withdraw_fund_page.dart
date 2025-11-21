import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/widgets/app_input_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../bloc/withdraw_bloc.dart';
import '../bloc/withdraw_event.dart';
import '../bloc/withdraw_state.dart';

class WithdrawFundPage extends StatelessWidget {
  final double currentBalance;
  final double availableBalance;
  const WithdrawFundPage({
    super.key,
    required this.currentBalance,
    required this.availableBalance,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Withdraw Funds",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),

      body: BlocListener<WithdrawBloc, WithdrawState>(
        listener: (context, state) {
          if (state is WithdrawLoading) {
            AppBottomSheets.showLoading(
              context,
              message: "Processing Withdraw...",
            );
          } else if (state is WithdrawSuccess) {
            AppBottomSheets.hide(context);
            AppBottomSheets.showSuccess(
              context,
              message: "Withdraw of \$${state.amount} Successful",
            );
            Navigator.pop(context, state.amount);
          } else if (state is WithdrawError) {
            AppBottomSheets.hide(context);
            AppBottomSheets.showError(context, message: state.message);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// ----------- Balance Card --------------
              _balanceCard(),

              SizedBox(height: AppSizes.bodyPadding),

              /// ---------- Bank Details Card -----------
              _bankInfoCard(),

              SizedBox(height: AppSizes.bodyPadding),

              /// ---------- Withdraw Amount Input -----------
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Withdraw Amount",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              AppTextField(
                controller: amountController,
                hintText: "Enter Amount",
                prefixIcon: Icon(Icons.monetization_on),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 40),

              /// ---------- Withdraw Button ------------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final amount = amountController.text.trim();

                    if (amount.isEmpty) {
                      AppBottomSheets.showError(
                        context,
                        message: "Please enter an amount to withdraw",
                      );
                      return;
                    }
                    context.read<WithdrawBloc>().add(
                      PerformWithdrawEvent(
                        amount: double.parse(amount),
                        bankAccount: "2321332",
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Withdraw",
                    style: TextStyle(color: AppColors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ---------------- Balance Card ----------------
  Widget _balanceCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Balance",
          style: TextStyle(
            color: AppColors.textBlack1.withAlpha(70),
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "\$${availableBalance.toStringAsFixed(2)}",
          style: TextStyle(
            color: AppColors.textBlack1,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// ---------------- Bank Info Card ----------------
  Widget _bankInfoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bank Account Details",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 18),

          _infoRow("Account Holder", "Rifat Hasan"),
          const SizedBox(height: 10),

          _infoRow("Bank Name", "Brac Bank Ltd"),
          const SizedBox(height: 10),

          _infoRow("Account Number", "0123456789"),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
