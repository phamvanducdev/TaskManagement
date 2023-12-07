import 'package:flutter/material.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';

class InputTaskDescriptionWidget extends StatelessWidget {
  final CreateTaskViewModel viewModel;
  final TextEditingController? controller;

  const InputTaskDescriptionWidget({
    super.key,
    required this.viewModel,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task description',
            style: appTheme.textTheme.titleSmall?.copyWith(
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFDCE0EE),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                viewModel.onChangeTaskDescription(value);
              },
              decoration: InputDecoration(
                hintText: 'Input task description...',
                hintStyle: appTheme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF6D7491).withOpacity(0.5),
                ),
                counterText: '',
                counter: const SizedBox.shrink(),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                isDense: true,
              ),
              style: appTheme.textTheme.bodyLarge,
              cursorColor: const Color(0xFF6D7491),
              maxLines: null,
            ),
          ),
        ],
      ),
    );
  }
}
