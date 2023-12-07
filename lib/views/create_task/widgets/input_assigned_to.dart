import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/domains/models/user.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';
import 'package:task_management/views/create_task/widgets/input_assigned_to_item.dart';

class InputAssignedToWidget extends StatelessWidget {
  final CreateTaskViewModel viewModel;
  final Function() onTap;

  const InputAssignedToWidget({
    super.key,
    required this.viewModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assigned to',
            style: appTheme.textTheme.titleSmall?.copyWith(
              letterSpacing: -0.28,
            ),
          ),
          const SizedBox(height: 12),
          StreamBuilder<List<User>>(
            stream: viewModel.streamUsersAssign,
            builder: (context, snapshot) {
              List<User> users = snapshot.data ?? [];
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...users
                      .map(
                        (user) => InputAssignedToItemWidget(
                          user: user,
                          onRemove: () {
                            viewModel.onRemoveUserAssign(user);
                          },
                        ),
                      )
                      .toList(),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF3F5FA),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFDCE0EE),
                        ),
                        borderRadius: BorderRadius.circular(38),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/ic_add.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
