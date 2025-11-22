import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/di/app_dependencies.dart';

void main() async {
  // Initialize dependencies first
  await AppDependencies.init();

  runApp(const MyApp());
}
