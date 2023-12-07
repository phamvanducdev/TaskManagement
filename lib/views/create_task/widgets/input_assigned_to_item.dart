import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/domains/models/user.dart';
import 'package:task_management/theme/app_theme.dart';

class InputAssignedToItemWidget extends StatelessWidget {
  final User user;
  final Function() onRemove;

  const InputAssignedToItemWidget({
    super.key,
    required this.user,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFDCE0EE)),
          borderRadius: BorderRadius.circular(38),
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(user.avatar),
                fit: BoxFit.fill,
              ),
              shape: const OvalBorder(),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            user.name,
            style: appTheme.textTheme.bodyLarge,
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: onRemove,
            child: SvgPicture.asset('assets/images/ic_remove.svg'),
          ),
        ],
      ),
    );
  }
}
