import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_management/domains/models/project.dart';
import 'package:task_management/domains/models/task.dart';
import 'package:task_management/domains/models/user.dart';
import 'package:task_management/domains/repositories/project_repository.dart';
import 'package:task_management/domains/repositories/task_repository.dart';
import 'package:task_management/domains/repositories/user_repository.dart';

enum CreateTaskState {
  creating,
  completed,
  failed,
}

class CreateTaskViewModel {
  TaskRepository taskRepository = GetIt.instance<TaskRepository>();
  UserRepository userRepository = GetIt.instance<UserRepository>();
  ProjectRepository projectRepository = GetIt.instance<ProjectRepository>();

  final BehaviorSubject<List<User>> _streamUsers = BehaviorSubject();
  Stream<List<User>> get streamUsers => _streamUsers.stream;

  final BehaviorSubject<List<Project>> _streamProjects = BehaviorSubject();
  Stream<List<Project>> get streamProjects => _streamProjects.stream;
  List<Project> get projects => _streamProjects.value;

  final BehaviorSubject<String> _streamTaskName = BehaviorSubject();
  Stream<String> get streamTaskName => _streamTaskName.stream;

  final BehaviorSubject<String> _streamTaskDescription = BehaviorSubject();
  Stream<String> get streamTaskDescription => _streamTaskDescription.stream;

  final BehaviorSubject<Project?> _streamProject = BehaviorSubject();
  Stream<Project?> get streamProject => _streamProject.stream;

  final BehaviorSubject<List<User>> _streamUsersAssign = BehaviorSubject();
  Stream<List<User>> get streamUsersAssign => _streamUsersAssign.stream;

  final BehaviorSubject<DateTime> _streamDeadline =
      BehaviorSubject.seeded(DateTime.now());
  Stream<DateTime> get streamDeadline => _streamDeadline.stream;
  DateTime get deadline => _streamDeadline.value;

  final BehaviorSubject<bool> _streamValidation = BehaviorSubject();
  Stream<bool> get streamValidation => _streamValidation.stream;

  final BehaviorSubject<CreateTaskState> _streamCreateTaskState =
      BehaviorSubject();
  Stream<CreateTaskState> get streamCreateTaskState =>
      _streamCreateTaskState.stream;

  initialized() async {
    _streamUsers.add(await userRepository.fetchUsers());
    _streamProjects.add(await projectRepository.fetchProjects());
    _streamProject.add(_streamProjects.value.first);
    _streamUsersAssign.add(_streamUsers.value);
  }

  onChangeTaskName(String taskName) {
    _streamTaskName.add(taskName);
    onValidate();
  }

  onChangeTaskDescription(String taskDescription) {
    _streamTaskDescription.add(taskDescription);
    onValidate();
  }

  onChangeProject(Project project) {
    _streamProject.add(project);
    onValidate();
  }

  onAddUserAssign(List<User> users) {
    _streamUsersAssign.add(users);
    onValidate();
  }

  onRemoveUserAssign(User user) {
    List<User> usersAssign = _streamUsersAssign.value;
    usersAssign.remove(user);
    _streamUsersAssign.add(usersAssign);
    onValidate();
  }

  onChangeDeadline(DateTime deadline) {
    _streamDeadline.add(deadline);
    onValidate();
  }

  onValidate() {
    _streamValidation.add(
      _streamTaskName.hasValue &&
          _streamTaskName.value.isNotEmpty &&
          _streamTaskDescription.hasValue &&
          _streamTaskDescription.value.isNotEmpty &&
          _streamProject.value != null &&
          _streamUsersAssign.value.isNotEmpty,
    );
  }

  onCreate() async {
    Task task = Task(
      title: _streamTaskName.value,
      desciption: _streamTaskDescription.value,
      project: _streamProject.value!,
      deadline: _streamDeadline.value,
      status: TaskStatus.inProgress,
    );
    try {
      _streamCreateTaskState.add(CreateTaskState.creating);
      await taskRepository.addTask(task);
      await Future.delayed(const Duration(seconds: 3));
      _streamCreateTaskState.add(CreateTaskState.completed);
    } catch (e) {
      debugPrint(e.toString());
      _streamCreateTaskState.add(CreateTaskState.failed);
    }
  }

  onSaveToDraft() {}
}
