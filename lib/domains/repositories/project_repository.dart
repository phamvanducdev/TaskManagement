import 'package:get_it/get_it.dart';
import 'package:task_management/domains/data_sources/project_data_source.dart';
import 'package:task_management/domains/models/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> fetchProjects();
}

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectDataSource projectDataSource = GetIt.instance<ProjectDataSource>();

  @override
  Future<List<Project>> fetchProjects() async {
    return projectDataSource.getProjects();
  }
}
