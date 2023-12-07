// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/theme/app_theme.dart';

enum FilterTimeType {
  today,
  weekday,
  monthday,
  all,
}

extension FilterTimeTypeExtension on FilterTimeType {
  String get label {
    switch (this) {
      case FilterTimeType.today:
        return 'Today';
      case FilterTimeType.weekday:
        return 'Weekday';
      case FilterTimeType.monthday:
        return 'Monthday';
      case FilterTimeType.all:
        return 'All';
    }
  }
}

class FilterTimeMenuWidget extends StatefulWidget {
  final Function(FilterTimeType) onChanged;

  const FilterTimeMenuWidget({
    super.key,
    required this.onChanged,
  });

  @override
  State<FilterTimeMenuWidget> createState() => _FilterTimeMenuWidgetState();
}

class _FilterTimeMenuWidgetState extends State<FilterTimeMenuWidget> {
  FilterTimeType _type = FilterTimeType.today;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 24,
                ),
                ...FilterTimeType.values
                    .map(
                      (type) => FilterTimeItemWidget(
                        type: type,
                        onTap: () {
                          setState(() {
                            _type = type;
                          });
                          widget.onChanged(type);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
                SizedBox(
                  width: double.infinity,
                  height: 24,
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 120,
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFDCE0EE)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: Text(
                  _type.label,
                  style: appTheme.textTheme.bodyMedium,
                ),
              ),
            ),
            SizedBox(width: 8),
            SvgPicture.asset("assets/images/ic_arrow_down.svg"),
          ],
        ),
      ),
    );
  }
}

class FilterTimeItemWidget extends StatelessWidget {
  final FilterTimeType type;
  final Function() onTap;

  const FilterTimeItemWidget({
    super.key,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 8),
        padding: EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFDCE0EE)),
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        child: Center(
          child: Text(
            type.label,
            style: appTheme.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
