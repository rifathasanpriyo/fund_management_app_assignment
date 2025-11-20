import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/local_database/auth_db.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/check_login_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_application_1/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/login_usecase.dart';

import 'features/auth/data/data_sources/fake_auth_data_source.dart';

void main() {
  // Create dependencies
  final dataSource = FakeAuthDataSource();
  final sessionManager = SessionManager();
  final authRepository = AuthRepositoryImpl(dataSource, sessionManager);

  // Create use cases
  final loginUseCase = LoginUseCase( authRepository);
  final checkLoginStatusUseCase = CheckLoginStatusUseCase(authRepository);

  runApp(MyApp(
    loginUseCase: loginUseCase,
    checkLoginStatusUseCase: checkLoginStatusUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;
  final CheckLoginStatusUseCase checkLoginStatusUseCase;

  const MyApp({
    super.key,
    required this.loginUseCase,
    required this.checkLoginStatusUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            loginUseCase: loginUseCase,
            checkLoginStatusUseCase: checkLoginStatusUseCase,
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
        home: LoginPage(),
      ),
    );
  }
}
