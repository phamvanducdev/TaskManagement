import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management/views/create_task/create_task_screen.dart';
import 'package:task_management/views/home_screen/home_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'create',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateTaskScreen();
          },
        ),
      ],
    ),
  ],
);
