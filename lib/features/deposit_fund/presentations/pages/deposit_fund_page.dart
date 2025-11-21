import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/widgets/app_input_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../bloc/deposit_bloc.dart';
import '../bloc/deposit_state.dart';
import '../widgets/confirm_dialog.dart';

class DepositFundPage extends StatefulWidget {
  const DepositFundPage({super.key});

  @override
  State<DepositFundPage> createState() => _DepositFundPageState();
}

class _DepositFundPageState extends State<DepositFundPage> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deposit", style: TextStyle(color: AppColors.white)),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: BlocListener<DepositBloc, DepositState>(
        listener: (context, state) {
          if (state is DepositLoading) {
            AppBottomSheets.showLoading(
              context,
              message: "Processing Deposit...",
            );
          } else if (state is DepositSuccess) {
            AppBottomSheets.hide(context);
            AppBottomSheets.showSuccess(context, message: "Deposit Successful");
            Navigator.pop(context);
            Navigator.pop(context);
          } else if (state is DepositError) {
            AppBottomSheets.hide(context);
            AppBottomSheets.showError(context, message: state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Enter the amount you wish to deposit \nsecurely.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              AppTextField(
                controller: amountController,
                hintText: "Enter Amount",
                prefixIcon: Icon(Icons.monetization_on),
                keyboardType: TextInputType.number,
              ),

              const Spacer(),

              /// Deposit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final text = amountController.text.trim();

                    if (text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter an amount")),
                      );
                      return;
                    }

                    showDepositConfirmDialog(context, text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Deposit",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Confirmation Dialog
  void showDepositConfirmDialog(BuildContext context, String amount) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ConfirmDialog(amount: amount);
      },
    );
  }
}
