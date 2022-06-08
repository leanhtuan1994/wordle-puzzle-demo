import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../common/constants.dart';
import '../common/di/injection.dart';
import '../common/routes.dart';
import '../common/theme/dark.dart';
import '../common/theme/theme.dart';
import '../common/widgets/loader_overlay/loader_overlay_widget.dart';
import '../generated/l10n.dart';
import 'common/lang/language_cubit.dart';
import 'common/theme/theme_cubit.dart';
import 'routes.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _providers,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final lang = state.language;
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return GlobalLoaderOverlay(
                useDefaultLoading: false,
                overlayWidget: const LoaderOverlayWidget(),
                overlayColor: Colors.black26,
                overlayOpacity: 0.3,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorKey: App.rootNavigatorKey,
                  navigatorObservers: [
                    MyRouteObserver(),
                  ],
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                  ],
                  darkTheme: buildDarkTheme,
                  theme: buildLightTheme,
                  themeMode: state.themeMode,
                  locale: Locale.fromSubtags(languageCode: lang),
                  supportedLocales: S.delegate.supportedLocales,
                  initialRoute: _initialRoute,
                  onGenerateRoute: Routes.generateRoute,
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<BlocProvider> get _providers => [
        BlocProvider<LanguageCubit>(
          create: (_) => getIt.get<LanguageCubit>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => getIt.get<ThemeCubit>(),
        )
      ];

  String get _initialRoute => RouteList.root;
}
