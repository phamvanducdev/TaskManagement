// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_management/views/home_screen/calendar_page/calendar_page.dart';
import 'package:task_management/views/home_screen/profile_page/profile_page.dart';
import 'package:task_management/views/home_screen/project_page/project_page.dart';
import 'package:task_management/views/home_screen/home_page/home_page.dart';
import 'package:task_management/views/home_screen/setting_page/setting_page.dart';
import 'package:task_management/views/home_screen/widgets/bottom_navigation.dart';

class TabItem {
  final int index;
  final String icon;
  final Widget page;

  TabItem({
    required this.index,
    required this.icon,
    required this.page,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<TabItem> _tabItems = <TabItem>[
    TabItem(
      index: 0,
      icon: 'assets/images/ic_tab_home.svg',
      page: const HomePage(),
    ),
    TabItem(
      index: 1,
      icon: 'assets/images/ic_tab_project.svg',
      page: const ProjectPage(),
    ),
    TabItem(
      index: 2,
      icon: 'assets/images/ic_tab_calendar.svg',
      page: const CalendarPage(),
    ),
    TabItem(
      index: 3,
      icon: 'assets/images/ic_tab_profile.svg',
      page: const ProfilePage(),
    ),
    TabItem(
      index: 4,
      icon: 'assets/images/ic_tab_setting.svg',
      page: const SettingPage(),
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFDFE3F0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                child: _tabItems[_selectedIndex].page,
              ),
              BottomNavigation(
                tabItems: _tabItems,
                onTabChange: _onItemTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
