part of 'game_bloc.dart';

enum CheckState { idle, loading, success, failure, mismatched }

class GameState extends Equatable {
  const GameState({
    this.curAttempts = '',
    this.curAttemptCount = 0,
    this.acceptInput = true,
    this.inputs,
    this.isWin = false,
    this.status = CheckState.idle,
    this.keyInputted,
  });

  final String curAttempts;
  final int curAttemptCount;
  final bool acceptInput;
  final List<List<PanelItem>>? inputs;
  final bool isWin;
  final CheckState status;
  final Map<String, InputState>? keyInputted;

  @override
  List<Object?> get props => [
        curAttempts,
        curAttemptCount,
        acceptInput,
        inputs,
        isWin,
        status,
        keyInputted,
      ];

  GameState copyWith(
      {String? curAttempts,
      int? curAttemptCount,
      bool? acceptInput,
      List<List<PanelItem>>? inputs,
      bool? isWin,
      CheckState? status,
      Map<String, InputState>? keyInputted}) {
    return GameState(
      curAttempts: curAttempts ?? this.curAttempts,
      curAttemptCount: curAttemptCount ?? this.curAttemptCount,
      acceptInput: acceptInput ?? this.acceptInput,
      inputs: inputs ?? this.inputs,
      isWin: isWin ?? this.isWin,
      status: status ?? this.status,
      keyInputted: keyInputted ?? this.keyInputted,
    );
  }
}
