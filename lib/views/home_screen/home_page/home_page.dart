// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_management/views/home_screen/home_page/home_page_view_model.dart';
import 'package:task_management/views/home_screen/home_page/widgets/app_bar.dart';
import 'package:task_management/views/home_screen/home_page/widgets/summary.dart';
import 'package:task_management/views/home_screen/home_page/widgets/task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageViewModel viewModel = HomePageViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarWidget(
        onPressedAction: () {
          // TODO
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SummaryWidget(viewModel: viewModel),
            TaskListWidget(viewModel: viewModel),
            SizedBox(height: 86),
          ],
        ),
      ),
    );
  }
}
