part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class InputEvent extends GameEvent {
  final InputType type;
  final String? char;

  const InputEvent({
    required this.type,
    this.char,
  });
}

class VerifyGuessEvent extends GameEvent {
  final String guess;

  const VerifyGuessEvent({
    required this.guess,
  });
}

class ResetNewGameEvent extends GameEvent {}

class ResetCheckStateEvent extends GameEvent {}
