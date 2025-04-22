import 'package:flutter/widgets.dart';

mixin HookMixin<T extends StatefulWidget> on State<T> {
  final _listenables = <ChangeNotifier>[];

  TextEditingController useTextEditingController({String? text}) {
    final controller = TextEditingController(text: text);
    _listenables.add(controller);
    return controller;
  }

  FocusNode useFocusNode() {
    final focusNode = FocusNode();
    _listenables.add(focusNode);
    return focusNode;
  }

  @override
  void dispose() {
    for (final listenable in _listenables) {
      listenable.dispose();
    }
    super.dispose();
  }
}
