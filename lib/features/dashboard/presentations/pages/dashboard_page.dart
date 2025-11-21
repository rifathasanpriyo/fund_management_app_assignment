import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_sizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/balance_card_widget.dart';
import '../widgets/manu_option_widget.dart';
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
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is DashboardError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is DashboardLoaded) {
            final data = state.data;
            final currentBalance = data.currentBalance;
            final availableBalance = data.availableBalance;
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Balance Cards
                      BalanceCardWidget(
                        currentBalance: currentBalance,
                        availableBalance: availableBalance,
                      ),
                      SizedBox(height: AppSizes.bodyPadding),

                      ManuOptionWidget(
                       data: data,
                      ),
                      
                      SizedBox(height: AppSizes.bodyPadding * 2),

                      Row(
                        children: [
                          Text(
                            "Recent Transactions",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "See all",
                            style: TextStyle(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.insidePadding),
                      // Transactions List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: data.transactions.length,
                        itemBuilder: (context, index) {
                          final tx = data.transactions[index];
                          return RecentTransactionsListCardWidgets(tx: tx);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return Center(child: Text("Unknown state"));
        },
      ),
    );
  }
}
