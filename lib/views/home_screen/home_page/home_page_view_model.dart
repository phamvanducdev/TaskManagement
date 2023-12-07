import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task_management/domains/models/task.dart';
import 'package:task_management/domains/repositories/task_repository.dart';
import 'package:task_management/views/home_screen/home_page/widgets/summary_filter.dart';
import 'package:task_management/views/home_screen/home_page/widgets/task_list_filter.dart';

class HomePageViewModel {
  final TaskRepository _taskRepository = GetIt.instance<TaskRepository>();

  final BehaviorSubject<FilterTimeType> _streamFilterTime =
      BehaviorSubject.seeded(FilterTimeType.today);
  Stream<FilterTimeType> get streamFilterTime => _streamFilterTime.stream;

  final BehaviorSubject<FilterStatusType> _streamFilterStatus =
      BehaviorSubject.seeded(FilterStatusType.allTasks);
  Stream<FilterStatusType> get streamFilterStatus => _streamFilterStatus.stream;

  final BehaviorSubject<List<Task>> _streamFilteredTask = BehaviorSubject();
  Stream<List<Task>> get streamFilteredTask => _streamFilteredTask.stream;

  final BehaviorSubject<List<Task>> _streamInProgressTasks = BehaviorSubject();
  Stream<List<Task>> get streamInProgressTasks => _streamInProgressTasks.stream;

  final BehaviorSubject<List<Task>> _streamCompletedTasks = BehaviorSubject();
  Stream<List<Task>> get streamCompletedTasks => _streamCompletedTasks.stream;

  final BehaviorSubject<List<Task>> _streamDisplayTasks = BehaviorSubject();
  Stream<List<Task>> get streamDisplayTasks => _streamDisplayTasks.stream;

  List<Task> _allTasks = List.empty();

  Future<void> fetchTasks() async {
    _allTasks = await _taskRepository.fetchTasks();
    _filterTime();
    _filterStatus();
  }

  onChangeFilterTimeType(FilterTimeType type) {
    _streamFilterTime.add(type);
    _filterTime();
    _filterStatus();
  }

  onChangeFilterStatusType(FilterStatusType type) {
    _streamFilterStatus.add(type);
    _filterStatus();
  }

  _filterStatus() {
    switch (_streamFilterStatus.value) {
      case FilterStatusType.inProgress:
        _streamDisplayTasks.add(_streamInProgressTasks.value);
        break;
      case FilterStatusType.completed:
        _streamDisplayTasks.add(_streamCompletedTasks.value);
        break;
      default:
        _streamDisplayTasks.add(_streamFilteredTask.value);
    }
  }

  _filterTime() {
    switch (_streamFilterTime.value) {
      case FilterTimeType.today:
        _streamFilteredTask.add(_allTasks.filterToday());
        break;
      case FilterTimeType.weekday:
        _streamFilteredTask.add(_allTasks.filterWeekday());
        break;
      case FilterTimeType.monthday:
        _streamFilteredTask.add(_allTasks.filterMonthday());
        break;
      default:
        _streamFilteredTask.add(_allTasks);
    }
    _streamInProgressTasks.add(
      _streamFilteredTask.value.filterByStatus(TaskStatus.inProgress),
    );
    _streamCompletedTasks.add(
      _streamFilteredTask.value.filterByStatus(TaskStatus.completed),
    );
  }
}

extension ListTaskExtension on List<Task> {
  List<Task> filterByStatus(status) =>
      where((element) => element.status == status).toList();

  List<Task> filterToday() =>
      where((element) => isToday(element.deadline)).toList();

  List<Task> filterWeekday() =>
      where((element) => isWeekday(element.deadline)).toList();

  List<Task> filterMonthday() =>
      where((element) => isMonthday(element.deadline)).toList();

  bool isToday(DateTime dateTime) {
    DateTime now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  bool isWeekday(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime startOfWeek = DateTime(
      now.year,
      now.month,
      now.day - now.weekday + 1,
    );
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    return dateTime.isAfter(startOfWeek) && dateTime.isBefore(endOfWeek);
  }

  bool isMonthday(DateTime dateTime) {
    DateTime now = DateTime.now();
    return dateTime.year == now.year && dateTime.month == now.month;
  }
}
