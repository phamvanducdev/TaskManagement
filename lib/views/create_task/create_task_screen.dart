import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:task_management/share/widgets/global_loading.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';
import 'package:task_management/views/create_task/widgets/app_bar.dart';
import 'package:task_management/views/create_task/widgets/input_assigned_to.dart';
import 'package:task_management/views/create_task/widgets/input_deadline.dart';
import 'package:task_management/views/create_task/widgets/input_project_name.dart';
import 'package:task_management/views/create_task/widgets/input_task_description.dart';
import 'package:task_management/views/create_task/widgets/input_task_name.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  CreateTaskViewModel viewModel = CreateTaskViewModel();

  TextEditingController? _inputNameController;
  TextEditingController? _inputDescriptionController;

  @override
  void initState() {
    super.initState();
    _inputNameController = TextEditingController();
    _inputDescriptionController = TextEditingController();

    viewModel.initialized();
    viewModel.streamCreateTaskState.listen((event) {
      switch (event) {
        case CreateTaskState.creating:
          GlobalLoadingWidget.show();
          break;
        case CreateTaskState.completed:
          GlobalLoadingWidget.hide();
          context.pop();
          break;
        case CreateTaskState.failed:
          GlobalLoadingWidget.hide();
          break;
      }
    });
  }

  @override
  void dispose() {
    _inputNameController?.dispose();
    _inputDescriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.2],
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFDFE3F0),
          ],
        ),
      ),
      child: SafeArea(
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBarWidget(
              onBack: () {
                context.pop();
              },
              onSaveToDraft: () => viewModel.onSaveToDraft(),
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 42,
                      width: double.infinity,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 24,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InputTaskNameWidget(
                                  viewModel: viewModel,
                                  controller: _inputNameController,
                                ),
                                InputTaskDescriptionWidget(
                                  viewModel: viewModel,
                                  controller: _inputDescriptionController,
                                ),
                                InputProjectNameWidget(
                                  viewModel: viewModel,
                                  onAddNew: () {
                                    // TODO onAddNew()
                                  },
                                  onChanged: (_) {
                                    // TODO onChanged()
                                  },
                                ),
                                InputAssignedToWidget(
                                  viewModel: viewModel,
                                  onTap: () {
                                    // TODO onTap()
                                  },
                                ),
                                InputDeadlineWidget(
                                  viewModel: viewModel,
                                  onTap: () {
                                    // TODO onTap()
                                  },
                                ),
                                const SizedBox(height: 56),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<bool>(
                  stream: viewModel.streamValidation,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF613BE7),
                            disabledBackgroundColor: const Color(0xFF969696),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: snapshot.data == true
                              ? (() => viewModel.onCreate())
                              : null,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Text(
                              'Create new tasks',
                              textAlign: TextAlign.center,
                              style: appTheme.textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
