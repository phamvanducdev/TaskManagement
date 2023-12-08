import 'package:get_it/get_it.dart';
import 'package:task_management/domains/data_sources/task_data_sources.dart';
import 'package:task_management/domains/models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
  Future<void> addTask(Task task);
}

class TasksRepositoryImpl extends TaskRepository {
  TaskDataSource taskDataSource = GetIt.instance<TaskDataSource>();

  @override
  Future<List<Task>> fetchTasks() async {
    List<Task> tasks = List.from(taskDataSource.getTasks());
    tasks.sort((a, b) {
      return -a.deadline.compareTo(b.deadline);
    });
    return tasks;
  }

  @override
  Future<void> addTask(Task task) async {
    taskDataSource.addTask(task);
  }
}
