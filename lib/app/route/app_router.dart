import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/login_page.dart';

import '../../features/dashboard/presentations/pages/dashboard_page.dart';
import '../../features/deposit_fund/presentations/pages/deposit_fund_page.dart';
import '../../features/fund/presentations/pages/fund_details_page.dart';
import '../../features/splash/presentations/pages/splash_page.dart';
import '../../features/transaction_history/presentation/pages/transaction_history_page.dart';
import '../../features/withdraw_fund/presentation/pages/withdraw_fund_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashPage:
        return CupertinoPageRoute(builder: (_) => SplashPage());
      case '/':
        return CupertinoPageRoute(builder: (_) => const Placeholder());
      case AppRoutes.loginPage:
        return CupertinoPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.dashboardPage:
        return CupertinoPageRoute(builder: (_) => DashboardPage());
      case AppRoutes.fundDetailsPage:
        return CupertinoPageRoute(builder: (_) => FundDetailsPage());
      case AppRoutes.depositFundPage:
        return CupertinoPageRoute(builder: (_) => DepositFundPage());
      case AppRoutes.withdrawFundPage:
        return CupertinoPageRoute(
          builder: (_) => WithdrawFundPage(
            currentBalance:
                settings.arguments != null &&
                    (settings.arguments as Map).containsKey('currentBalance')
                ? (settings.arguments as Map)['currentBalance'] as double
                : 0.0,
            availableBalance:
                settings.arguments != null &&
                    (settings.arguments as Map).containsKey('availableBalance')
                ? (settings.arguments as Map)['availableBalance'] as double
                : 0.0,
          ),
          
        );
        case AppRoutes.transactionHistoryPage:
        return CupertinoPageRoute(builder: (_) => const TransactionHistoryPage());
      default:
        return CupertinoPageRoute(builder: (_) => const Placeholder());
    }
  }
}
