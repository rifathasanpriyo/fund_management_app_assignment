import 'package:flutter_application_1/core/local_database/auth_db.dart';
import 'package:flutter_application_1/features/auth/data/data_sources/fake_auth_data_source.dart';
import 'package:flutter_application_1/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/login_usecase.dart';

import 'package:flutter_application_1/features/dashboard/data/data_sourecs/fake_dashboard_data_source.dart';
import 'package:flutter_application_1/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:flutter_application_1/features/dashboard/domain/usecases/get_dashboard_data_use_cases.dart';

import 'package:flutter_application_1/features/fund/data/data_sources/fake_fund_data_source.dart';
import 'package:flutter_application_1/features/fund/data/repositories/fund_repository_impl.dart';
import 'package:flutter_application_1/features/fund/domain/usecases/get_fund_details.dart';

import 'package:flutter_application_1/features/deposit_fund/data/data_sources/fake_deposit_data_source.dart';
import 'package:flutter_application_1/features/deposit_fund/domain/usecases/deposit_usecase.dart';

import 'package:flutter_application_1/features/withdraw_fund/data/data_sources/fake_withdraw_data_source.dart';
import 'package:flutter_application_1/features/withdraw_fund/data/repositories/withdraw_repository_impl.dart';
import 'package:flutter_application_1/features/withdraw_fund/domain/usecases/withdraw_usecase.dart';

import 'package:flutter_application_1/features/transaction_history/data/data_sources/fake_transaction_data_source.dart';
import 'package:flutter_application_1/features/transaction_history/data/repositories/transaction_repository_impl.dart';
import 'package:flutter_application_1/features/transaction_history/domain/usecases/get_transactions_usecase.dart';

import '../../features/deposit_fund/data/repository/deposit_repository_impl.dart';

class AppDependencies {
  // Auth
  static late final FakeAuthDataSource authDataSource;
  static late final SessionManager sessionManager;
  static late final AuthRepositoryImpl authRepository;
  static late final LoginUseCase loginUseCase;

  // Dashboard
  static late final FakeDashboardDataSource dashboardDS;
  static late final DashboardRepositoryImpl dashboardRepository;
  static late final GetDashboardDataUseCase getDashboardDataUseCase;

  // Fund
  static late final GetFundDetailsUseCase getFundDetailsUseCase;

  // Deposit
  static late final DepositUseCase depositUseCase;

  // Withdraw
  static late final WithdrawUseCase withdrawUseCase;

  // Transactions
  static late final GetTransactionsUseCase getTransactionsUseCase;

  static Future<void> init() async {
    // Auth
    authDataSource = FakeAuthDataSource();
    sessionManager = SessionManager();
    authRepository = AuthRepositoryImpl(authDataSource, sessionManager);
    loginUseCase = LoginUseCase(authRepository);

    // Dashboard
    dashboardDS = FakeDashboardDataSource();
    dashboardRepository = DashboardRepositoryImpl(dashboardDS);
    getDashboardDataUseCase = GetDashboardDataUseCase(dashboardRepository);

    // Fund
    getFundDetailsUseCase = GetFundDetailsUseCase(
      FundRepositoryImpl(FakeFundDataSource()),
    );

    // Deposit
    depositUseCase = DepositUseCase(
      DepositRepositoryImpl(FakeDepositDataSource()),
    );

    // Withdraw
    withdrawUseCase = WithdrawUseCase(
      WithdrawRepositoryImpl(FakeWithdrawDataSource()),
    );

    // Transactions
    getTransactionsUseCase = GetTransactionsUseCase(
      TransactionRepositoryImpl(FakeTransactionDataSource()),
    );
  }
}
