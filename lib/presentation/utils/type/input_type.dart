import 'package:flutter/material.dart';

import '../../widgets/keyboard_widget.dart';

enum InputType { character, back, confirm }

Color mapBGColorByState(InputState? state) {
  switch (state) {
    case InputState.correct:
      return Colors.green.shade600;
    case InputState.present:
      return Colors.yellow.shade800;
    case InputState.absent:
      return Colors.grey.shade700;

    default:
      return Colors.white;
  }
}

Color mapBorderColorByState(InputState? state) {
  switch (state) {
    case InputState.correct:
      return Colors.green.shade600;
    case InputState.present:
      return Colors.yellow.shade800;
    case InputState.absent:
      return Colors.grey.shade700;

    default:
      return Colors.grey.shade600;
  }
}
