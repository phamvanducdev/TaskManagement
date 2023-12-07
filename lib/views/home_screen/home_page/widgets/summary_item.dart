import 'package:flutter/material.dart';
import 'package:task_management/theme/app_theme.dart';

class SummaryItemWidget extends StatelessWidget {
  final String title;
  final String value;

  const SummaryItemWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFDCE0EE)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: appTheme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.start,
            style: appTheme.textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
