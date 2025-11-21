import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/route/app_router.dart';
import 'package:flutter_application_1/features/dashboard/data/data_sourecs/fake_dashboard_data_source.dart';
import 'package:flutter_application_1/features/dashboard/domain/usecases/get_dashboard_data_use_cases.dart';
import 'package:flutter_application_1/features/deposit_fund/data/repository/deposit_repository_impl.dart';
import 'package:flutter_application_1/features/deposit_fund/domain/usecases/deposit_usecase.dart';
import 'package:flutter_application_1/features/deposit_fund/presentations/bloc/deposit_bloc.dart';
import 'package:flutter_application_1/features/fund/data/data_sources/fake_fund_data_source.dart';
import 'package:flutter_application_1/features/fund/data/repositories/fund_repository_impl.dart';
import 'package:flutter_application_1/features/fund/domain/usecases/get_fund_details.dart';
import 'package:flutter_application_1/features/fund/presentations/bloc/fund_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/local_database/auth_db.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/check_login_status.dart';
import 'app/route/app_routes.dart';
import 'features/auth/data/data_sources/fake_auth_data_source.dart';
import 'features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'features/dashboard/presentations/bloc/dashboard_bloc.dart';
import 'features/deposit_fund/data/data_sources/fake_deposit_data_source.dart';

void main() {
  runApp(const MyApp());
}

// Dependency injection container
class AppDependencies {
  static final dataSource = FakeAuthDataSource();
  static final sessionManager = SessionManager();
  static final authRepository = AuthRepositoryImpl(dataSource, sessionManager);
  static final loginUseCase = LoginUseCase(authRepository);
  static final checkLoginStatusUseCase = CheckLoginStatusUseCase(
    authRepository,
  );

  static final dashboardDataSource = FakeDashboardDataSource();
  static final dashboardRepository = DashboardRepositoryImpl(
    dashboardDataSource,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            loginUseCase: AppDependencies.loginUseCase,
            checkLoginStatusUseCase: AppDependencies.checkLoginStatusUseCase,
          ),
        ),
        BlocProvider<DashboardBloc>(
          create: (_) => DashboardBloc(
            GetDashboardDataUseCase(AppDependencies.dashboardRepository),
          ),
        ),

        BlocProvider(
      create: (_) => FundBloc(
        GetFundDetailsUseCase(
          FundRepositoryImpl(
            FakeFundDataSource(),
          ),
        ),
      ),
    ),

             BlocProvider(
      create: (_) => DepositBloc(
        DepositUseCase(
          DepositRepositoryImpl(
            FakeDepositDataSource(),
          ),
        ),
      ),
    ),

        // Add more Blocs here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRoutes.splashPage,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
