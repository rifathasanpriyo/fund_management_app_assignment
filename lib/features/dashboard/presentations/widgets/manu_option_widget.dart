import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/route/app_routes.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../withdraw_fund/presentation/pages/withdraw_fund_page.dart';
import '../../domain/entities/dashboard_entity.dart';

class ManuOptionWidget extends StatefulWidget {
  final DashboardEntity? data;
  const ManuOptionWidget({super.key, required this.data});

  @override
  State<ManuOptionWidget> createState() => _ManuOptionWidgetState();
}

class _ManuOptionWidgetState extends State<ManuOptionWidget> {
  @override
  Widget build(BuildContext context) {
    final currentBalance = widget.data!.currentBalance;
    final availableBalance = widget.data!.availableBalance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.depositFundPage);
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(AppIcons.arrowUp, color: AppColors.blue, size: 30),
              ),
              SizedBox(height: 8),
              Text("Deposit", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),

        GestureDetector(
          onTap: () async {
            final withdrawnAmount = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WithdrawFundPage(
                  currentBalance: currentBalance,
                  availableBalance: availableBalance,
                ),
              ),
            );

            if (withdrawnAmount != null) {
              setState(() {
                widget.data!.currentBalance -= withdrawnAmount as double;
                widget.data!.availableBalance -= withdrawnAmount;
              });
            }
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  AppIcons.arrowDown,
                  color: AppColors.blue,
                  size: 30,
                ),
              ),
              SizedBox(height: 8),
              Text("Withdraw", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.fundDetailsPage);
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  AppIcons.fundDetails,
                  color: AppColors.blue,
                  size: 30,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Fund Details",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
