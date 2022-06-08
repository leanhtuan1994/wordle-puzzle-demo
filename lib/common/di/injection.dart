import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/local/data_manager.dart';
import '../../data/datasources/remote/app_api.dart';
import '../../data/repositories/app_repository.dart';
import '../../presentation/common/lang/language_cubit.dart';
import '../../presentation/common/theme/theme_cubit.dart';
import '../../presentation/features/game_play/blocs/bloc/game_bloc.dart';
import '../network/dio_client.dart';

part 'modules/api_module.dart';
part 'modules/bloc_module.dart';
part 'modules/components_module.dart';
part 'modules/repository_module.dart';

GetIt getIt = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await ComponentsModule().provides();
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}
