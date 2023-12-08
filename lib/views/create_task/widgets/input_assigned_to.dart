import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/domains/models/user.dart';
import 'package:task_management/theme/app_theme.dart';
import 'package:task_management/views/create_task/create_task_view_model.dart';

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
          const SizedBox(height: 4),
          StreamBuilder<List<User>>(
            stream: viewModel.streamUsersAssign,
            builder: (context, snapshot) {
              List<User> users = snapshot.data ?? [];
              return Wrap(
                spacing: 4,
                runSpacing: 8,
                children: [
                  ...users
                      .map(
                        (user) => Chip(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(0xFFDCE0EE),
                            ),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          avatar: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar),
                          ),
                          label: Text(user.name),
                          labelStyle: appTheme.textTheme.bodyLarge,
                          deleteIcon: SvgPicture.asset(
                            'assets/images/ic_remove.svg',
                          ),
                          onDeleted: () {
                            viewModel.onRemoveUserAssign(user);
                          },
                        ),
                      )
                      .toList(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF3F5FA),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFDCE0EE),
                        ),
                        borderRadius: BorderRadius.circular(24),
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
