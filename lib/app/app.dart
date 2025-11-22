import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/dashboard/presentations/bloc/dashboard_bloc.dart';
import '../features/fund/presentations/bloc/fund_bloc.dart';
import '../features/deposit_fund/presentations/bloc/deposit_bloc.dart';
import '../features/withdraw_fund/presentation/bloc/withdraw_bloc.dart';
import '../features/transaction_history/presentation/bloc/transaction_bloc.dart';

import 'route/app_router.dart';
import 'route/app_routes.dart';
import 'di/app_dependencies.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            loginUseCase: AppDependencies.loginUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => DashboardBloc(
            AppDependencies.getDashboardDataUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => FundBloc(
            AppDependencies.getFundDetailsUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => DepositBloc(
            AppDependencies.depositUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => WithdrawBloc(
            AppDependencies.withdrawUseCase,
          ),
        ),
        BlocProvider(
          create: (_) => TransactionBloc(
            AppDependencies.getTransactionsUseCase,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fund Management",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRoutes.splashPage,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
