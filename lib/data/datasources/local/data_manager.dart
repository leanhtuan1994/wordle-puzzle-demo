import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/config.dart';

part './data_manager_impl.dart';
part './prefs/app_preferences.dart';
part './prefs/app_preferences_impl.dart';

abstract class DataManager implements AppPreferences {}
