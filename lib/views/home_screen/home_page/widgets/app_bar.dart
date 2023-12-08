import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:task_management/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function() onPressedAction;

  const AppBarWidget({
    super.key,
    required this.onPressedAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 4, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning Andre!',
                style: appTheme.textTheme.bodyLarge,
              ),
              Text(
                DateFormat('dd MMM, yyyy').format(DateTime.now()),
                style: appTheme.textTheme.titleLarge,
              ),
            ],
          ),
          IconButton(
            onPressed: onPressedAction,
            icon: SvgPicture.asset('assets/images/ic_notification.svg'),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
