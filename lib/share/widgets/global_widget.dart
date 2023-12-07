import 'package:flutter/material.dart';
import 'package:task_management/share/widgets/global_loading.dart';

class GlobalWidget extends StatelessWidget {
  final Widget? container;

  const GlobalWidget({
    super.key,
    required this.container,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          container ?? Container(),
          const GlobalLoadingWidget(),
        ],
      ),
    );
  }
}
