import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoadingParameter {
  final bool isVisible;

  LoadingParameter({
    required this.isVisible,
  });
}

class GlobalLoadingWidget extends StatelessWidget {
  static final _stream = BehaviorSubject.seeded(
    LoadingParameter(isVisible: false),
  );

  static show() {
    _stream.add(LoadingParameter(isVisible: true));
  }

  static hide() {
    _stream.add(LoadingParameter(isVisible: false));
  }

  const GlobalLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoadingParameter>(
      stream: _stream.stream,
      builder: (context, snapshot) {
        return snapshot.data?.isVisible == true
            ? Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.4),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : Container();
      },
    );
  }
}
