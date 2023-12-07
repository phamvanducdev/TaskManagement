// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/domains/models/task.dart';
import 'package:task_management/theme/app_theme.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final Function(Task) onTap;
  final Function(Task) onTapAction;

  const TaskItemWidget({
    super.key,
    required this.task,
    required this.onTap,
    required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(task),
      child: Column(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFDCE0EE)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: appTheme.textTheme.titleMedium?.copyWith(
                      letterSpacing: -0.32,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    task.desciption,
                    style: appTheme.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_tab_project.svg',
                                  width: 12,
                                  height: 12,
                                  colorFilter: ColorFilter.mode(
                                    Color(0xFF0D101C),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  task.project.name,
                                  style: appTheme.textTheme.bodySmall?.copyWith(
                                    height: 0.14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/ic_timer.svg',
                                  width: 12,
                                  height: 12,
                                  colorFilter: ColorFilter.mode(
                                    Color(0xFF0D101C),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  task.deadlineFormated(),
                                  style: appTheme.textTheme.bodySmall?.copyWith(
                                    height: 0.14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onTapAction(task),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: ShapeDecoration(
                            color: task.status == TaskStatus.inProgress
                                ? Color(0xFFEAF5FF)
                                : Color(0xFFF0ECFC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: task.status == TaskStatus.inProgress
                              ? Text(
                                  'On going',
                                  style: appTheme.textTheme.headlineSmall
                                      ?.copyWith(
                                          color: Color(0xFF2B7FFC),
                                          fontSize: 12),
                                )
                              : Text(
                                  'New task',
                                  style: appTheme.textTheme.headlineSmall
                                      ?.copyWith(
                                          color: Color(0xFF613BE7),
                                          fontSize: 12),
                                ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
