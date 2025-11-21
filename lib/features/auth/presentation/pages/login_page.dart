
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/widgets/app_input_widgets.dart';
import '../../../../app/route/app_routes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../widgets/login_header_widget.dart';
import '../../presentation/bloc/auth_bloc.dart';
import '../../presentation/bloc/auth_event.dart';
import '../../presentation/bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Login Header
              const LoginHeaderWidget(),
              const SizedBox(height: AppSizes.bodyPadding * 2),

              // Bloc Listener for Auth State
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    AppBottomSheets.showLoading(
                      context,
                      message: "Logging in...",
                    );
                  } else if (state is AuthAuthenticated) {
                    // Navigate to Home or Dashboard
                    AppBottomSheets.hide(context);
                    AppBottomSheets.showSuccess(
                      context,
                      message: "Login Successful",
                    );
//Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  DashboardPage()));
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.dashboardPage,
              (route) => false,
            );
                  } else if (state is AuthError) {
                    AppBottomSheets.hide(context);
                    AppBottomSheets.showError(context, message: state.message);
                  }
                },
                child: Column(
                  children: [
                    // Email TextField
                    AppTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: AppSizes.bodyPadding),

                    // Password TextField
                    AppTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: AppSizes.bodyPadding),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();

                          if (email.isNotEmpty && password.isNotEmpty) {
                            context.read<AuthBloc>().add(
                              AuthLoginRequested(email, password),
                            );
                          } else {
                            AppBottomSheets.showError(
                              context,
                              message: "Please enter email and password",
                            );
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.bodyPadding),

              // Register text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "Register",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
