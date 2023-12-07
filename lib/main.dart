// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_management/get_it/get_it_register.dart';
import 'package:task_management/router/app_router.dart';
import 'package:task_management/share/widgets/global_widget.dart';
import 'package:task_management/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetItRegister.register();
  runApp(const TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      routerConfig: appRouter,
      theme: appTheme,
      builder: (context, child) {
        return GlobalWidget(container: child);
      },
    );
  }
}
