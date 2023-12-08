import 'package:task_management/domains/data_sources/project_data_source.dart';
import 'package:task_management/domains/models/task.dart';

final List<Task> mockTasks = [
  Task(
    title: 'Homepage Redesign',
    desciption:
        'Redesign the homepage of our website to improve user engagement and align with our updated branding guidelines. Focus on creating an intuitive user interface with enhanced visual appeal.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now(),
    status: TaskStatus.inProgress,
  ),
  Task(
    title: 'App Enhancements',
    desciption:
        'Optimize the user interface for our mobile app, ensuring a seamless and delightful user experience. Consider incorporating user feedback and modern design trends to enhance usability and aesthetics.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now().add(const Duration(days: 4)),
    status: TaskStatus.completed,
  ),
  Task(
    title: 'E-commerce Checkout Process Redesign',
    desciption:
        'Redesign the checkout process for our e-commerce platform, focusing on improving conversion rates and reducing abandoned carts. Optimize the UI to guide users smoothly through the purchasing journey.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now().subtract(const Duration(days: 12)),
    status: TaskStatus.inProgress,
  ),
  Task(
    title: 'SEO Optimization',
    desciption:
        'Improve the website\'s search engine optimization (SEO) by optimizing keywords, meta tags, and content. Aim to increase organic traffic and enhance online visibility.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now().add(const Duration(days: 7)),
    status: TaskStatus.inProgress,
  ),
  Task(
    title: 'Customer Feedback Analysis',
    desciption:
        'Analyze customer feedback across platforms to gather insights for product improvements. Identify common issues and areas for enhancement to refine user experience.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now().add(const Duration(days: 2)),
    status: TaskStatus.completed,
  ),
  Task(
    title: 'Performance Testing',
    desciption:
        'Conduct comprehensive performance testing on the website and app. Identify and resolve any performance bottlenecks to ensure smooth and efficient functionality.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now(),
    status: TaskStatus.inProgress,
  ),
  Task(
    title: 'Localization for New Markets',
    desciption:
        'Localize website and app content for new target markets. Adapt language, currency, and cultural elements to enhance user experience and expand market reach.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now(),
    status: TaskStatus.completed,
  ),
  Task(
    title: 'Security Audit',
    desciption:
        'Conduct a comprehensive security audit for the website and app. Identify vulnerabilities and implement measures to enhance data protection and user privacy.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now().add(const Duration(days: 3)),
    status: TaskStatus.completed,
  ),
  Task(
    title: 'User Onboarding Revamp',
    desciption:
        'Revamp the user onboarding process to make it more intuitive and engaging. Aim to reduce bounce rates and increase user retention from the initial interaction.',
    project: (mockProjects..shuffle()).first,
    deadline: DateTime.now().add(const Duration(days: 1)),
    status: TaskStatus.inProgress,
  ),
];

abstract class TaskDataSource {
  List<Task> getTasks();
  void addTask(Task task);
}

class TaskDataSourceImpl extends TaskDataSource {
  @override
  List<Task> getTasks() => List.from(mockTasks);

  @override
  void addTask(Task task) {
    mockTasks.add(task);
  }
}
