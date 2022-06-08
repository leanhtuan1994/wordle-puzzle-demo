import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/help_widget.dart';
import '../../widgets/keyboard_widget.dart';
import 'blocs/bloc/game_bloc.dart';
import 'game_panel.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'WORDLE',
          style: context.headline3,
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(4.0),
            icon: const Icon(Icons.help_outline_outlined),
            tooltip: "How to play",
            enableFeedback: false,
            onPressed: () {
              showHelpDialog(context: context);
            },
          ),
          IconButton(
            padding: const EdgeInsets.all(4.0),
            icon: const Icon(Icons.refresh_rounded),
            tooltip: "Reset game",
            enableFeedback: false,
            onPressed: () {
              BlocProvider.of<GameBloc>(context).add(ResetNewGameEvent());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(child: GamePanelWidget()),
            KeyboardWidget(),
          ],
        ),
      ),
    );
  }
}
