import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rxdart/rxdart.dart';

class LoadingParameter {
  final bool isVisible;

  LoadingParameter({
    required this.isVisible,
  });
}

class GlobalLoadingWidget extends HookWidget {
  const GlobalLoadingWidget({super.key});

  static final _stream =
      BehaviorSubject.seeded(LoadingParameter(isVisible: false));

  static show() {
    _stream.add(LoadingParameter(isVisible: true));
  }

  static hide() {
    _stream.add(LoadingParameter(isVisible: false));
  }

  static get isVisible {
    return _stream.value.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    final opacityController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    useAnimation(opacityController);

    var params = useStream(_stream).data;

    if (params == null) {
      return Container();
    }

    useEffect(() {
      if (params.isVisible) {
        opacityController.forward();
      } else {
        opacityController.reverse();
      }
      return null;
    }, [params.isVisible]);

    if (opacityController.value == 0.0) {
      return Container();
    }

    return Opacity(
      opacity: opacityController.value,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.4),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
