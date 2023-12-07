import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function() onBack;
  final Function() onSaveToDraft;

  const AppBarWidget({
    super.key,
    required this.onBack,
    required this.onSaveToDraft,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 16, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: SvgPicture.asset(
              'assets/images/ic_arrow_left.svg',
              width: 24,
              height: 24,
            ),
          ),
          Expanded(
            child: Text(
              'Create new task',
              style: appTheme.textTheme.titleLarge?.copyWith(
                fontSize: 20,
                letterSpacing: -0.36,
              ),
            ),
          ),
          Text(
            'Save to draft',
            textAlign: TextAlign.center,
            style: appTheme.textTheme.titleSmall?.copyWith(
              color: const Color(0xFF613BE7),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
