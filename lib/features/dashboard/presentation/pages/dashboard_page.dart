import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_sizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/balance_card_widget.dart';
import '../widgets/recent_transations_list_card_widgets.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(LoadDashboardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.insidePadding,
          vertical: AppSizes.insidePadding + 6,
        ),
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return Center(child: CircularProgressIndicator.adaptive());
            } else if (state is DashboardError) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is DashboardLoaded) {
              final data = state.data;
              final currentBalance = data.currentBalance;
              final availableBalance = data.availableBalance;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Balance Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BalanceCardWidget(
                        title: "Current Balance",
                        amount: currentBalance,
                      ),
                      BalanceCardWidget(
                        title: "Available Balance",
                        amount: availableBalance,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.bodyPadding),
                  Text(
                    "Recent Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: AppSizes.insidePadding),
                  // Transactions List
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.transactions.length,
                      itemBuilder: (context, index) {
                        final tx = data.transactions[index];
                        return RecentTransactionsListCardWidgets(tx: tx);
                      },
                    ),
                  ),
                ],
              );
            }

            return Center(child: Text("Unknown state"));
          },
        ),
      ),
    );
  }

}
