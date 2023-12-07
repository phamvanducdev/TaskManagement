import 'package:flutter/material.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';

class InputTaskNameWidget extends StatefulWidget {
  final CreateTaskViewModel viewModel;
  final TextEditingController? controller;

  const InputTaskNameWidget({
    super.key,
    required this.viewModel,
    this.controller,
  });

  @override
  State<InputTaskNameWidget> createState() => _InputTaskNameWidgetState();
}

class _InputTaskNameWidgetState extends State<InputTaskNameWidget> {
  int _counter = 0;

  updateCounter() {
    setState(() {
      _counter = widget.controller?.text.length ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  onChanged: (value) {
                    updateCounter();
                    widget.viewModel.onChangeTaskName(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Input task name...',
                    hintStyle: appTheme.textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF6D7491).withOpacity(0.5),
                      fontSize: 24,
                      letterSpacing: -0.48,
                    ),
                    counterText: '',
                    counter: const SizedBox.shrink(),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    isDense: true,
                  ),
                  style: appTheme.textTheme.titleLarge?.copyWith(
                    color: const Color(0xFF0D101C),
                    fontSize: 24,
                    letterSpacing: -0.48,
                  ),
                  cursorColor: const Color(0xFF0D101C),
                  cursorHeight: 32,
                  maxLength: 45,
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$_counter',
                        style: appTheme.textTheme.titleSmall?.copyWith(
                          color: const Color(0xFF613BE7),
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: '/45',
                        style: appTheme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF6D7491),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Color(0xFFDCE1EF),
          ),
        ],
      ),
    );
  }
}
