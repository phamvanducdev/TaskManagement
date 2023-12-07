import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/theme/app_theme.dart';

class InputTaskSelectionItemWidget extends StatelessWidget {
  final String value;
  final Function() onTap;

  const InputTaskSelectionItemWidget({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xFFDCE0EE),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: appTheme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(width: 4),
            SvgPicture.asset("assets/images/ic_arrow_down.svg"),
          ],
        ),
      ),
    );
  }
}
