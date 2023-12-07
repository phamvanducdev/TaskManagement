import 'package:intl/intl.dart';
import 'package:task_management/domains/models/project.dart';

enum TaskStatus {
  inProgress,
  completed,
}

class Task {
  final String title;
  final String desciption;
  final Project project;
  final DateTime deadline;
  final TaskStatus status;

  Task({
    required this.title,
    required this.desciption,
    required this.project,
    required this.deadline,
    required this.status,
  });

  String deadlineFormated() => DateFormat('MMMM dd, yyyy').format(deadline);
}
