import 'package:get_it/get_it.dart';
import 'package:task_management/domains/repositories/project_repository.dart';
import 'package:task_management/domains/repositories/task_repository.dart';
import 'package:task_management/domains/repositories/user_repository.dart';
import 'package:task_management/get_it/get_it_register.dart';

class RepositoryRegister extends IGetItRegister {
  final GetIt instance = GetIt.instance;

  @override
  Future<void> register() async {
    if (!GetIt.I.isRegistered<UserRepository>()) {
      instance.registerSingleton<UserRepository>(UserRepositoryImpl());
    }
    if (!GetIt.I.isRegistered<ProjectRepository>()) {
      instance.registerSingleton<ProjectRepository>(ProjectRepositoryImpl());
    }
    if (!GetIt.I.isRegistered<TaskRepository>()) {
      instance.registerSingleton<TaskRepository>(TasksRepositoryImpl());
    }
  }
}
