import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/constants.dart';
import '../common/di/injection.dart';
import 'features/game_play/blocs/bloc/game_bloc.dart';
import 'features/game_play/game_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _builder = _getAll(settings)[settings.name]!;
    return MaterialPageRoute(
      builder: _builder,
      settings: settings,
      fullscreenDialog: false,
    );
  }

  static Map<String, WidgetBuilder?> _getAll(RouteSettings settings) => {
        RouteList.root: (context) {
          return BlocProvider(
            create: (_) => getIt.get<GameBloc>(),
            child: const GameScreen(),
          );
        }
      };
}
