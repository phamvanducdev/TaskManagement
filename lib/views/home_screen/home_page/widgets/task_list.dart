// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management/domains/models/task.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/home_screen/home_page/home_page_view_model.dart';
import 'package:task_management/views/home_screen/home_page/widgets/summary_filter.dart';
import 'package:task_management/views/home_screen/home_page/widgets/task_item.dart';
import 'package:task_management/views/home_screen/home_page/widgets/task_list_filter.dart';

class TaskListWidget extends StatelessWidget {
  final HomePageViewModel viewModel;

  const TaskListWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StreamBuilder<FilterTimeType>(
            stream: viewModel.streamFilterTime,
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data?.label} tasks',
                style: appTheme.textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  letterSpacing: -0.40,
                ),
              );
            },
          ),
          SizedBox(height: 8),
          TaskListFilterWidget(
            onChanged: (type) {
              viewModel.onChangeFilterStatusType(type);
            },
          ),
          SizedBox(height: 12),
          StreamBuilder<List<Task>>(
            stream: viewModel.streamDisplayTasks,
            builder: (context, snapshot) {
              List<Task> tasks = snapshot.data ?? [];
              return Column(
                children: tasks
                    .map(
                      (task) => TaskItemWidget(
                        task: task,
                        onTap: (_) {
                          // TODO openDetail()
                        },
                        onTapAction: (task) async {
                          if (task.status == TaskStatus.completed) {
                            await context.push('/create');
                            viewModel.fetchTasks();
                          } else {
                            // TODO openDetail()
                          }
                        },
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
