import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../common/extensions.dart';
import '../utils/type/input_type.dart';
import 'keyboard_widget.dart';

Future<void> showHelpDialog({required BuildContext context}) {
  return showGeneralDialog(
    context: context,
    transitionDuration: const Duration(milliseconds: 500),
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final scaleAnimation =
          Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutExpo,
      ));
      final opacityAnimation =
          Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ));
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
              opacity: opacityAnimation.value,
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: child,
              ));
        },
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Builder(
          builder: (context) {
            return Dialog(
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          context.l10n.howToPlay.toUpperCase(),
                          style: context.bodyText1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _DecoratedTitleWidget(
                                    title: context.l10n.helpTitle),
                                _DecoratedPlainText(
                                  text: context.l10n.helpDesc1,
                                ),
                                _DecoratedPlainText(
                                    text: context.l10n.helpDesc2),
                                _DecoratedPlainText(
                                    text: context.l10n.helpDesc3),
                                _DecoratedTitleWidget(
                                    title: context.l10n.example),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(
                                    children: const [
                                      _DecoratedTextBox(
                                          letter: "W",
                                          state: InputState.correct),
                                      _DecoratedTextBox(
                                          letter: "E",
                                          state: InputState.initial),
                                      _DecoratedTextBox(
                                          letter: "A",
                                          state: InputState.initial),
                                      _DecoratedTextBox(
                                          letter: "R",
                                          state: InputState.initial),
                                      _DecoratedTextBox(
                                          letter: "Y",
                                          state: InputState.initial),
                                    ],
                                  ),
                                ),
                                _DecoratedPlainText(
                                    text: context.l10n.exampleDesc1),
                                Row(
                                  children: const [
                                    _DecoratedTextBox(
                                        letter: "P", state: InputState.absent),
                                    _DecoratedTextBox(
                                        letter: "I", state: InputState.present),
                                    _DecoratedTextBox(
                                        letter: "L", state: InputState.absent),
                                    _DecoratedTextBox(
                                        letter: "L", state: InputState.absent),
                                    _DecoratedTextBox(
                                        letter: "L", state: InputState.absent),
                                  ],
                                ),
                                _DecoratedPlainText(
                                  text: context.l10n.exampleDesc2,
                                ),
                                Row(
                                  children: const [
                                    _DecoratedTextBox(
                                        letter: "V", state: InputState.absent),
                                    _DecoratedTextBox(
                                        letter: "A", state: InputState.absent),
                                    _DecoratedTextBox(
                                        letter: "G", state: InputState.absent),
                                    _DecoratedTextBox(
                                        letter: "U", state: InputState.absent),
                                    _DecoratedTextBox(
                                        letter: "E", state: InputState.absent),
                                  ],
                                ),
                                _DecoratedPlainText(
                                    text: context.l10n.exampleDesc3),
                              ]),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextButton(
                          child: Text(
                            context.l10n.gotIt.toUpperCase(),
                            style: context.bodyText1?.copyWith(
                              color: Colors.grey[850],
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

class _DecoratedTitleWidget extends StatelessWidget {
  const _DecoratedTitleWidget({required this.title, Key? key})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: context.headline4,
      ),
    );
  }
}

class _DecoratedPlainText extends StatelessWidget {
  const _DecoratedPlainText({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text,
        style: context.bodyText2,
      ),
    );
  }
}

class _DecoratedTextBox extends StatelessWidget {
  const _DecoratedTextBox({required this.letter, required this.state, Key? key})
      : super(key: key);

  final String letter;
  final InputState state;

  @override
  Widget build(BuildContext context) {
    final mainTextColor =
        state != InputState.initial ? Colors.white : Colors.grey.shade800;
    var backGroundColor = mapBGColorByState(state);
    var borderColor = mapBorderColorByState(state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        width: 40.0,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
          color: backGroundColor,
        ),
        child: Text(
          letter,
          style: context.headline3?.copyWith(
            color: mainTextColor,
          ),
        ),
      ),
    );
  }
}
