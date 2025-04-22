import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wordle/src/common/input_formatters/upper_case_text_formatter.dart';
import 'package:flutter_wordle/src/common/mixins/hook_mixin.dart';
import 'package:flutter_wordle/src/common/validator/validator.dart';

const kWordCellSize = 48.0;
const kWordCellSpacing = 4.0;

class WordInputField extends StatefulWidget {
  const WordInputField({required this.wordLength, this.enabled = true, this.onSubmit, super.key})
    : assert(wordLength > 0);

  final int wordLength;
  final bool enabled;
  final ValueChanged<String>? onSubmit;

  @override
  State<WordInputField> createState() => _WordInputFieldState();
}

class _WordInputFieldState extends State<WordInputField> with HookMixin {
  final controllers = <TextEditingController>[];
  final focusNodes = <FocusNode>[];
  final formKey = GlobalKey<FormState>();

  late final keyboardListenerFocusNode = useFocusNode();

  late FocusNode currentFocusNode;

  @override
  void initState() {
    super.initState();
    setupControllersAndFocusNodes(widget.wordLength);
    currentFocusNode = focusNodes.first;
  }

  @override
  void didUpdateWidget(covariant WordInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.wordLength != widget.wordLength) {
      clearControllersAndFocusNodes();
      setupControllersAndFocusNodes(widget.wordLength);
      focusNodes.first.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final wordLength = widget.wordLength;
    return KeyboardListener(
      focusNode: keyboardListenerFocusNode,
      onKeyEvent: (event) {
        if (!currentFocusNode.hasFocus) return;

        final i = focusNodes.indexOf(currentFocusNode);
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
          if (controllers[i].text.isEmpty && i > 0) {
            focusNodes[i - 1].requestFocus();
          }
        }
      },
      child: Form(
        key: formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: kWordCellSpacing,
          children: [
            for (int i = 0; i < wordLength; i++)
              Flexible(
                child: _LetterInputField(
                  controller: controllers[i],
                  focusNode: focusNodes[i],
                  enabled: widget.enabled,
                  autoFocus: i == 0,
                  onChanged: (value) {
                    if (value.length == 1) focusNextField(i);
                  },
                  onFieldSubmitted: i == wordLength - 1 ? submitWord : () => focusNextField(i),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void setupControllersAndFocusNodes(int wordLength) {
    for (int i = 0; i < wordLength; i++) {
      controllers.add(useTextEditingController());

      final focusNode = useFocusNode();
      focusNode.addListener(() {
        if (focusNode.hasFocus) currentFocusNode = focusNode;
      });
      focusNodes.add(focusNode);
    }
  }

  void clearControllersAndFocusNodes() {
    for (final controller in controllers) {
      controller.clear();
      controller.dispose();
    }
    for (final focusNode in focusNodes) {
      focusNode.unfocus();
      focusNode.dispose();
    }
    controllers.clear();
    focusNodes.clear();
  }

  void submitWord() {
    final form = formKey.currentState;
    if (form == null || !form.validate()) return;

    final word = controllers.map((c) => c.text).join();
    for (final controller in controllers) {
      controller.clear();
    }
    widget.onSubmit?.call(word);
    focusNodes.first.requestFocus();
  }

  void focusNextField(int i) {
    if (i < focusNodes.length - 1) {
      focusNodes[i + 1].requestFocus();
    }
  }
}

class _LetterInputField extends StatelessWidget {
  const _LetterInputField({
    required this.controller,
    required this.focusNode,
    required this.enabled,
    required this.autoFocus,
    required this.onChanged,
    required this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool enabled;
  final bool autoFocus;
  final ValueChanged<String> onChanged;
  final VoidCallback? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autoFocus,
      enabled: enabled,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted != null ? (_) => onFieldSubmitted?.call() : null,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      maxLength: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        counter: SizedBox.shrink(),
        constraints: BoxConstraints.tight(const Size(kWordCellSize, kWordCellSize)),
      ),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]$')), UpperCaseTextFormatter()],
      textCapitalization: TextCapitalization.characters,
      validator: Validator<String?>(rules: [NotEmptyRule(errorMessage: '')]),
    );
  }
}
