import 'package:flutter/material.dart';
import 'package:task_management/domains/models/project.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';
import 'package:task_management/views/create_task/widgets/input_task_selection_item.dart';

class InputProjectNameWidget extends StatelessWidget {
  final CreateTaskViewModel viewModel;
  final Function() onAddNew;
  final Function(Project) onChanged;

  const InputProjectNameWidget({
    super.key,
    required this.viewModel,
    required this.onAddNew,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Project name',
                  style: appTheme.textTheme.titleSmall?.copyWith(
                    letterSpacing: -0.28,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onAddNew,
                child: Text(
                  'Add new',
                  textAlign: TextAlign.center,
                  style: appTheme.textTheme.titleSmall?.copyWith(
                    color: const Color(0xFF613BE7),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          StreamBuilder<Project?>(
            stream: viewModel.streamProject,
            builder: (context, snapshot) {
              return InputTaskSelectionItemWidget(
                value: snapshot.data?.name ?? 'Select project...',
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (BuildContext context) {
                      return Wrap(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            height: 24,
                          ),
                          ...viewModel.projects
                              .map(
                                (project) => ProjectItemWidget(
                                  project: project,
                                  onTap: () {
                                    viewModel.onChangeProject(project);
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                              .toList(),
                          const SizedBox(
                            width: double.infinity,
                            height: 24,
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProjectItemWidget extends StatelessWidget {
  final Project project;
  final Function() onTap;

  const ProjectItemWidget({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDCE0EE)),
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        child: Center(
          child: Text(
            project.name,
            style: appTheme.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
