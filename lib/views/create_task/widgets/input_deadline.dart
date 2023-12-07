import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';
import 'package:task_management/views/create_task/widgets/input_task_selection_item.dart';

class InputDeadlineWidget extends StatelessWidget {
  final CreateTaskViewModel viewModel;
  final Function() onTap;

  const InputDeadlineWidget({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  Future<void> onShowDatePicker(BuildContext context) async {
    DateTime? dateChanged = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      helpText: "Select deadline date...",
      fieldLabelText: "fieldLabelText",
    );
    viewModel.onChangeDeadline(dateChanged ?? DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: viewModel.streamDeadline,
      builder: (context, snapshot) {
        DateTime deadline = snapshot.data ?? DateTime.now();
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deadline',
                style: appTheme.textTheme.titleSmall?.copyWith(
                  letterSpacing: -0.28,
                ),
              ),
              const SizedBox(height: 10),
              InputTaskSelectionItemWidget(
                value: DateFormat('MMMM dd, yyyy').format(deadline),
                onTap: () {
                  onShowDatePicker(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
