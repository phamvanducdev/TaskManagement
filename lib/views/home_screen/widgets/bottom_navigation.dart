import 'package:flutter/material.dart';
import 'package:task_management/views/home_screen/home_screen.dart';
import 'package:task_management/views/home_screen/widgets/bottom_navigation_item.dart';

class BottomNavigation extends StatefulWidget {
  final List<TabItem> tabItems;
  final Function(int tabIndex) onTabChange;

  const BottomNavigation({
    super.key,
    required this.tabItems,
    required this.onTabChange,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedTab = 0;

  void onTabPress(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });
      widget.onTabChange(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double height = 64;

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 24),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 24,
                offset: const Offset(0, 24),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.tabItems
                .map(
                  (tabItem) => BottomNavigationItem(
                    size: height,
                    icon: tabItem.icon,
                    isSelected: _selectedTab == tabItem.index,
                    onPressed: () {
                      onTabPress(tabItem.index);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
