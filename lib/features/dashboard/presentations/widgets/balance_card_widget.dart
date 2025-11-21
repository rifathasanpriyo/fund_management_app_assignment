import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

class BalanceCardWidget extends StatefulWidget {
  final double currentBalance;
  final double availableBalance;

  const BalanceCardWidget({
    super.key,
    required this.currentBalance,
    required this.availableBalance,
  });

  @override
  State<BalanceCardWidget> createState() => _BalanceCardWidgetState();
}

class _BalanceCardWidgetState extends State<BalanceCardWidget> {
  late final ValueNotifier<bool> _showBalance;

  @override
  void initState() {
    super.initState();
    _showBalance = ValueNotifier<bool>(true);
  }

  @override
  void dispose() {
    _showBalance.dispose();
    super.dispose();
  }

  String _maskAmount(String amount) {
    return List.filled(amount.length, '*').join();
  }

  @override
  Widget build(BuildContext context) {
    final formattedCurrent = "\$${widget.currentBalance.toStringAsFixed(2)}";
    final formattedAvailable =
        "\$${widget.availableBalance.toStringAsFixed(2)}";

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(200),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Current Balance",
                style: TextStyle(fontSize: 16, color: AppColors.subtitle2),
              ),
              GestureDetector(
                onTap: () => _showBalance.value = !_showBalance.value,
                child: Row(
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: _showBalance,
                      builder: (context, visible, _) => Icon(
                        visible
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        size: 20,
                        color: AppColors.subtitle2,
                      ),
                    ),
                    SizedBox(width: 4),
                    ValueListenableBuilder<bool>(
                      valueListenable: _showBalance,
                      builder: (context, visible, _) => Text(
                        visible ? "Hide" : "Show",
                        style: TextStyle(color: AppColors.subtitle2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          // Balance Amount (masked or real)
          ValueListenableBuilder<bool>(
            valueListenable: _showBalance,
            builder: (context, visible, _) {
              final display = visible
                  ? formattedCurrent
                  : _maskAmount(formattedCurrent);
              return Text(
                display,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              );
            },
          ),

          SizedBox(height: 10),

          // Available Balance + Add Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: _showBalance,
                builder: (context, visible, _) {
                  final display = visible
                      ? formattedAvailable
                      : _maskAmount(formattedAvailable);
                  return Text(
                    "Available: $display",
                    style: TextStyle(fontSize: 16, color: AppColors.subtitle2),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF007BFF),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Add Money", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
