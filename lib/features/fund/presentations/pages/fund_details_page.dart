import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../bloc/fund_bloc.dart';

import '../widgets/interactive_cart_widget.dart';
import '../widgets/summary_card_widget.dart';

class FundDetailsPage extends StatefulWidget {
  @override
  State<FundDetailsPage> createState() => _FundDetailsPageState();
}

class _FundDetailsPageState extends State<FundDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<FundBloc>().add(LoadFundEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fund Details", style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      body: BlocBuilder<FundBloc, FundState>(
        builder: (context, state) {
          if (state is FundLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is FundLoaded) {
            final d = state.data;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SummaryCardWidget(
                    title: "Current Balance",
                    value: d.currentBalance,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 14),
                  SummaryCardWidget(
                    title: "Invested Amount",
                    value: d.investedAmount,
                    color: AppColors.orange,
                  ),
                  SizedBox(height: 14),
                  SummaryCardWidget(
                    title: "Profit",
                    value: d.profit,
                    color: AppColors.green,
                  ),

                  SizedBox(height: 20),

                  _chartContainer(d.performanceData),
                ],
              ),
            );
          }

          if (state is FundError) {
            return Center(
              child: Text(state.message, style: TextStyle(color: Colors.red)),
            );
          }

          return Container();
        },
      ),
    );
  }

  /// -------------------- CHART CONTAINER --------------------
  Widget _chartContainer(List<double> data) {
    return Container(
      height: 320,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 1,
            color: Colors.black12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Performance Chart",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: AppSizes.insidePadding),
          Expanded(child: InteractiveCartWidget(data: data)),
        ],
      ),
    );
  }
}
