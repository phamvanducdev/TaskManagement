import 'package:flutter/material.dart';
import 'package:task_management/domains/models/task.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/home_screen/home_page/home_page_view_model.dart';
import 'package:task_management/views/home_screen/home_page/widgets/summary_filter.dart';
import 'package:task_management/views/home_screen/home_page/widgets/summary_item.dart';

class SummaryWidget extends StatefulWidget {
  final HomePageViewModel viewModel;

  const SummaryWidget({
    super.key,
    required this.viewModel,
  });

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Summary',
                style: appTheme.textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  letterSpacing: -0.40,
                ),
              ),
              FilterTimeMenuWidget(
                onChanged: (type) {
                  widget.viewModel.onChangeFilterTimeType(type);
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: StreamBuilder<List<Task>>(
                  stream: widget.viewModel.streamFilteredTask,
                  builder: (context, snapshot) {
                    return SummaryItemWidget(
                      title: 'Assigned tasks',
                      value: (snapshot.data ?? []).length.toString(),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: StreamBuilder<List<Task>>(
                  stream: widget.viewModel.streamCompletedTasks,
                  builder: (context, snapshot) {
                    return SummaryItemWidget(
                      title: 'Completed tasks',
                      value: (snapshot.data ?? []).length.toString(),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
