import 'package:task_management/domains/models/project.dart';

final List<Project> mockProjects = [
  Project(
    id: 'pid001',
    name: 'Website Revamp',
  ),
  Project(
    id: 'pid002',
    name: 'App Enhancements',
  )
];

abstract class ProjectDataSource {
  List<Project> projects();
}

class ProjectDataSourceImpl extends ProjectDataSource {
  @override
  List<Project> projects() {
    return mockProjects;
  }
}
