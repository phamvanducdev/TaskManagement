import 'package:get_it/get_it.dart';
import 'package:task_management/domains/data_sources/project_data_source.dart';
import 'package:task_management/domains/data_sources/task_data_sources.dart';
import 'package:task_management/domains/data_sources/user_data_source.dart';
import 'package:task_management/get_it/get_it_register.dart';

class DataSourceRegister extends IGetItRegister {
  final GetIt instance = GetIt.instance;

  @override
  Future<void> register() async {
    if (!GetIt.I.isRegistered<UserDataSource>()) {
      instance.registerSingleton<UserDataSource>(UserDataSourceImpl());
    }
    if (!GetIt.I.isRegistered<ProjectDataSource>()) {
      instance.registerSingleton<ProjectDataSource>(ProjectDataSourceImpl());
    }
    if (!GetIt.I.isRegistered<TaskDataSource>()) {
      instance.registerSingleton<TaskDataSource>(TaskDataSourceImpl());
    }
  }
}
