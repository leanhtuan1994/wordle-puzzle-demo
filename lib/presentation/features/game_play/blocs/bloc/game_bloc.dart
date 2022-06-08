import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models/guess_daily_result/guess_daily_result.dart';
import '../../../../../data/repositories/app_repository.dart';
import '../../../../utils/game_mode.dart';
import '../../../../utils/type/input_type.dart';
import '../../../../widgets/keyboard_widget.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final AppRepository repository;

  GameBloc({required this.repository})
      : super(GameState(inputs: initialInputs)) {
    on<InputEvent>(_handleInputEvent);
    on<VerifyGuessEvent>(_verifyGuessEvent);
    on<ResetNewGameEvent>(_onResetGameEvent);
  }

  void _onResetGameEvent(ResetNewGameEvent event, Emitter<GameState> emit) {
    emit(GameState(inputs: initialInputs));
  }

  void _verifyGuessEvent(
      VerifyGuessEvent event, Emitter<GameState> emit) async {
    try {
      emit(state.copyWith(
        status: CheckState.loading,
      ));

      final guess = event.guess;
      final results = await repository.verifyGuessDaily(guess: guess);
      final inputs = state.inputs;
      final currentAttempt = state.curAttemptCount;
      final currentGuess = inputs?[currentAttempt];

      final resultInput = currentGuess
          ?.mapIndexed(
            (index, element) =>
                element.copyWith(state: _mapInputState(results[index].result)),
          )
          .toList();

      inputs?[currentAttempt] = resultInput!;

      final isCorrect = _isCorrectGuess(results);

      var keyInputted = state.keyInputted ?? {};

      for (var e in results) {
        final preState =
            keyInputted[e.guess?.toUpperCase() ?? ''] ?? InputState.initial;
        if (preState != InputState.correct) {
          keyInputted[e.guess?.toUpperCase() ?? ''] = _mapInputState(e.result);
        }
      }

      emit(
        state.copyWith(
          inputs: inputs,
          curAttemptCount: currentAttempt + 1,
          curAttempts: '',
          isWin: isCorrect,
          acceptInput: currentAttempt + 1 < MAX_ATTEMPT,
          status: CheckState.success,
          keyInputted: keyInputted,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: CheckState.failure,
        ),
      );
    }
  }

  InputState _mapInputState(String? result) {
    if (result == InputState.present.name) {
      return InputState.present;
    }
    if (result == InputState.correct.name) {
      return InputState.correct;
    }

    return InputState.absent;
  }

  bool _isCorrectGuess(List<GuessDailyResult> results) {
    final isNotCorrect = results.any((element) => element.result != 'correct');
    return !isNotCorrect;
  }

  void _handleInputEvent(InputEvent event, Emitter<GameState> emit) {
    final type = event.type;
    final curAttempts = state.curAttempts;
    final r = state.curAttemptCount;
    final inputs = state.inputs;

    switch (type) {
      case InputType.back:
        if (curAttempts.isNotEmpty) {
          inputs?[r][curAttempts.length - 1].char = "";

          emit(
            state.copyWith(
              curAttempts: curAttempts.substring(0, curAttempts.length - 1),
              inputs: inputs,
            ),
          );
        }

        break;
      case InputType.character:
        if (event.char != null &&
            state.acceptInput &&
            curAttempts.length < WORD_LEN) {
          final newWord = '$curAttempts${event.char!}';
          inputs?[r][curAttempts.length].char = event.char!;

          emit(state.copyWith(
            curAttempts: newWord,
            inputs: inputs,
          ));
        }
        break;
      case InputType.confirm:
        if (curAttempts.length < WORD_LEN) break;
        add(VerifyGuessEvent(guess: curAttempts));
        break;
    }
  }
}

List<List<PanelItem>> get initialInputs {
  return List.generate(
    MAX_ATTEMPT,
    (index) => List.generate(
      WORD_LEN,
      (i) => PanelItem(),
    ),
  );
}

class PanelItem {
  String char;
  InputState state;

  PanelItem({
    this.char = '',
    this.state = InputState.initial,
  });

  PanelItem copyWith({
    String? char,
    InputState? state,
  }) {
    return PanelItem(
      char: char ?? this.char,
      state: state ?? this.state,
    );
  }
}
