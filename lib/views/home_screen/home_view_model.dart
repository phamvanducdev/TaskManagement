import 'package:get_it/get_it.dart';
import 'package:task_management/domains/repositories/task_repository.dart';

class HomeViewModel {
  TaskRepository taskRepository = GetIt.instance<TaskRepository>();
}
