// ignore_for_file: constant_identifier_names

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/base/base_stateful_widget.dart';
import '../../common/constants.dart';
import '../features/game_play/blocs/bloc/game_bloc.dart';
import '../utils/type/input_type.dart';

const ITEM_HEIGHT = 50.0;

enum InputState { initial, present, correct, absent }

class KeyboardWidget extends StatefulWidget {
  const KeyboardWidget({Key? key}) : super(key: key);

  @override
  State<KeyboardWidget> createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends BaseStatefulWidget<KeyboardWidget> {
  final _keyState = <String, InputState>{};

  GameBloc get _bloc => BlocProvider.of<GameBloc>(context);

  final List<List<String>> _keyPos = List<List<String>>.unmodifiable([
    ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
    ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M']
  ]);

  @override
  void initState() {
    super.initState();

    _initKeyboard();
  }

  void _initKeyboard() {
    final aCode = 'A'.codeUnitAt(0);
    final zCode = 'Z'.codeUnitAt(0);
    final alphabet = List<String>.generate(
      zCode - aCode + 1,
      (index) => String.fromCharCode(aCode + index),
    );

    for (String c in alphabet) {
      _keyState[c] ??= InputState.initial;
      _keyState[c] = InputState.initial;
    }
  }

  void _mapNewKeyState(Map<String, InputState>? keyInputted) {
    final keys = keyInputted ?? {};
    keys.forEach((key, value) {
      _keyState[key] = value;
    });

    if (keys.isEmpty) {
      _initKeyboard();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listener: (context, state) {
        _mapNewKeyState(state.keyInputted);
      },
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: MAX_WIDTH,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    ..._keyPos.first.map((e) => Expanded(
                          flex: 2,
                          child: _KeyboardInputItem(
                            char: e,
                            keyState: _keyState[e] ?? InputState.initial,
                            onPress: () {
                              _bloc.add(InputEvent(
                                  type: InputType.character, char: e));
                            },
                          ),
                        )),
                    const Spacer(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ..._keyPos[1].map(
                      (e) => Expanded(
                        flex: 1,
                        child: _KeyboardInputItem(
                          char: e,
                          keyState: _keyState[e] ?? InputState.initial,
                          onPress: () {
                            _bloc.add(
                                InputEvent(type: InputType.character, char: e));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ConstrainedBox(
                          constraints:
                              const BoxConstraints.expand(height: ITEM_HEIGHT),
                          child: ElevatedButton(
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.grey[700]),
                            ),
                            child: const Icon(
                              Icons.keyboard_backspace_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _bloc.add(const InputEvent(type: InputType.back));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    ..._keyPos[2].map(
                      (e) => Expanded(
                        flex: 2,
                        child: _KeyboardInputItem(
                          char: e,
                          keyState: _keyState[e] ?? InputState.initial,
                          onPress: () {
                            _bloc.add(
                                InputEvent(type: InputType.character, char: e));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ConstrainedBox(
                          constraints:
                              const BoxConstraints.expand(height: ITEM_HEIGHT),
                          child: ElevatedButton(
                            style: theme.elevatedButtonTheme.style?.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all<Color?>(
                                      Colors.green[600]),
                            ),
                            child: Text(
                              'ENTER',
                              style: textTheme.headline4?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              _bloc.add(
                                  const InputEvent(type: InputType.confirm));
                            },
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _KeyboardInputItem extends StatelessWidget {
  const _KeyboardInputItem({
    Key? key,
    required this.keyState,
    required this.char,
    this.onPress,
  }) : super(key: key);

  final VoidCallback? onPress;
  final InputState keyState;
  final String char;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(height: ITEM_HEIGHT),
        child: ElevatedButton(
          style: _mapButtonStyle(context, keyState: keyState),
          child: _CharacterWidget(
            character: char,
            inputted: keyState != InputState.initial,
          ),
          onPressed: onPress,
        ),
      ),
    );
  }

  ButtonStyle? _mapButtonStyle(BuildContext context,
      {required InputState keyState}) {
    return context.theme.elevatedButtonTheme.style?.copyWith(
      backgroundColor:
          MaterialStateProperty.all<Color?>(_mapColor(keyState: keyState)),
    );
  }

  Color? _mapColor({required InputState keyState}) {
    switch (keyState) {
      case InputState.initial:
        return Colors.grey[400];
      case InputState.correct:
        return Colors.green[600];
      case InputState.present:
        return Colors.yellow[800];
      case InputState.absent:
        return Colors.grey[700];
      default:
        return Colors.grey[400];
    }
  }
}

class _CharacterWidget extends StatelessWidget {
  const _CharacterWidget({
    Key? key,
    required this.character,
    this.inputted = false,
  }) : super(key: key);

  final String character;
  final bool inputted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        character,
        style: context.headline4?.copyWith(
          color: inputted ? Colors.white : Colors.grey[850],
        ),
      ),
    );
  }
}
