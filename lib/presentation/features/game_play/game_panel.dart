// ignore_for_file: constant_identifier_names, avoid_single_cascade_in_expression_statements

import 'dart:math' as math;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/base/base_stateful_widget.dart';
import '../../../common/constants.dart';
import '../../../common/extensions.dart';
import '../../utils/game_mode.dart';
import '../../utils/type/input_type.dart';
import '../../widgets/keyboard_widget.dart';
import 'blocs/bloc/game_bloc.dart';

class GamePanelWidget extends StatefulWidget {
  const GamePanelWidget({Key? key}) : super(key: key);

  @override
  State<GamePanelWidget> createState() => _GamePanelWidgetState();
}

class _GamePanelWidgetState extends BaseStatefulWidget<GamePanelWidget> {
  GameBloc get _bloc => BlocProvider.of<GameBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: WORD_LEN / MAX_ATTEMPT,
          child: BlocConsumer<GameBloc, GameState>(
            listener: (context, state) {
              if (state.status == CheckState.loading) {
                showLoading();
              } else {
                hideLoading();
                if (state.status == CheckState.mismatched) {
                  _showNotWordDialog();
                }
              }

              if (state.isWin) {
                _showWonDialog();
              } else if (state.curAttemptCount >= MAX_ATTEMPT) {
                _showLostDialog();
              }
            },
            listenWhen: (pre, cur) =>
                pre.isWin != pre.isWin ||
                pre.curAttemptCount != cur.curAttemptCount ||
                pre.status != cur.status,
            builder: (context, state) {
              final inputs = state.inputs;
              return Column(
                children: [
                  ...List.generate(
                    MAX_ATTEMPT,
                    (i) => Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          WORD_LEN,
                          (j) {
                            final data = inputs?[i][j];
                            return _PanelItemWidget(
                              item: data,
                              col: j,
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future _showNotWordDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.l10n.info),
          content: Text(context.l10n.notWordContent),
          actions: [
            TextButton(
              child: Text(context.l10n.ok),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    ).then((_) {
      _bloc.add(ResetCheckStateEvent());
    });
  }

  void _showLostDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.ERROR,
      bodyHeaderDistance: 42,
      width: device.width > MAX_WIDTH ? MAX_WIDTH : null,
      body: Center(
        child: Text(
          context.l10n.lostGameContent,
          style: context.bodyText1,
        ),
      ),
      btnOkOnPress: () {
        _bloc.add(ResetNewGameEvent());
      },
      btnOkColor: Colors.red.shade700,
      dismissOnTouchOutside: false,
      headerAnimationLoop: false,
      keyboardAware: false,
      dismissOnBackKeyPress: true,
      btnOkText: context.l10n.newGame,
    )..show();
  }

  void _showWonDialog() {
    AwesomeDialog(
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.SUCCES,
      bodyHeaderDistance: 42,
      width: device.width > MAX_WIDTH ? MAX_WIDTH : null,
      body: Center(
        child: Text(
          context.l10n.won,
          style: context.bodyText1,
        ),
      ),
      btnOkOnPress: () {
        _bloc.add(ResetNewGameEvent());
      },
      dismissOnTouchOutside: false,
      headerAnimationLoop: false,
      keyboardAware: false,
      dismissOnBackKeyPress: true,
      btnOkText: context.l10n.newGame,
    )..show();
  }
}

class _PanelItemWidget extends StatelessWidget {
  final PanelItem? item;
  final int col;

  const _PanelItemWidget({
    this.item,
    this.col = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500 + (col * 150)),
        switchInCurve: Curves.easeOut,
        reverseDuration: const Duration(milliseconds: 0),
        transitionBuilder: (child, animation) {
          return AnimatedBuilder(
            animation: animation,
            child: child,
            builder: (context, child) {
              final _animation =
                  Tween<double>(begin: math.pi / 2, end: 0).animate(animation);
              return Transform(
                transform: Matrix4.rotationX(_animation.value),
                alignment: Alignment.center,
                child: child,
              );
            },
          );
        },
        child: Padding(
          key: ValueKey((item?.state == InputState.initial) ? 0 : 1),
          padding: const EdgeInsets.all(5.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: mapBorderColorByState(item?.state),
                width: 1.0,
              ),
              color: mapBGColorByState(item?.state),
            ),
            child: Center(
              child: Text(
                item?.char ?? "",
                style: context.headline1?.copyWith(
                  color: item?.state != InputState.initial
                      ? Colors.white
                      : Colors.grey.shade800,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
