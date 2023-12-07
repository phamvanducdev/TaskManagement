import 'package:flutter/material.dart';
import 'package:task_management/theme/app_theme.dart';

enum FilterStatusType {
  allTasks,
  inProgress,
  completed,
}

extension FilterStatusTypeExtension on FilterStatusType {
  String get label {
    switch (this) {
      case FilterStatusType.allTasks:
        return 'All tasks';
      case FilterStatusType.inProgress:
        return 'In progress';
      case FilterStatusType.completed:
        return 'Completed';
    }
  }
}

class TaskListFilterWidget extends StatefulWidget {
  final Function(FilterStatusType) onChanged;

  const TaskListFilterWidget({
    super.key,
    required this.onChanged,
  });

  @override
  State<TaskListFilterWidget> createState() => _TaskListFilterWidgetState();
}

class _TaskListFilterWidgetState extends State<TaskListFilterWidget>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FilterStatusType.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color(0xFFDCE0EE),
          ),
          borderRadius: BorderRadius.circular(42),
        ),
      ),
      child: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
        ),
        child: TabBar(
          splashFactory: NoSplash.splashFactory,
          controller: _tabController,
          tabs: FilterStatusType.values
              .map((todayTaskType) => Tab(text: todayTaskType.label))
              .toList(),
          labelColor: Colors.white,
          labelPadding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
          labelStyle: appTheme.textTheme.titleSmall,
          unselectedLabelColor: const Color(0xFF6D7491),
          unselectedLabelStyle: appTheme.textTheme.bodyLarge,
          indicator: ShapeDecoration(
            color: const Color(0xFF613BE7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(4),
          dividerColor: Colors.transparent,
          onTap: (index) {
            widget.onChanged(FilterStatusType.values[index]);
          },
        ),
      ),
    );
  }
}
