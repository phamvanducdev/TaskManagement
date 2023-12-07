// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final double size;
  final String icon;
  final bool isSelected;
  final Function() onPressed;

  const BottomNavigationItem({
    super.key,
    required this.size,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: ShapeDecoration(
            color: isSelected ? Color(0xFFF0F2F8) : Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size / 2),
            ),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            icon,
            colorFilter: isSelected
                ? ColorFilter.mode(Color(0xFF0D101C), BlendMode.srcIn)
                : ColorFilter.mode(Color(0xFF93989D), BlendMode.srcIn),
          ),
          highlightColor: Colors.transparent,
        )
      ],
    );
  }
}
