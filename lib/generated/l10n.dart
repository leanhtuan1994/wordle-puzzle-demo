// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `LOST, PLEASE TRY TO PLAY AGAIN`
  String get lostGameContent {
    return Intl.message(
      'LOST, PLEASE TRY TO PLAY AGAIN',
      name: 'lostGameContent',
      desc: '',
      args: [],
    );
  }

  /// `NEW GAME`
  String get newGame {
    return Intl.message(
      'NEW GAME',
      name: 'newGame',
      desc: '',
      args: [],
    );
  }

  /// `WON`
  String get won {
    return Intl.message(
      'WON',
      name: 'won',
      desc: '',
      args: [],
    );
  }

  /// `WORDLE`
  String get gameTitle {
    return Intl.message(
      'WORDLE',
      name: 'gameTitle',
      desc: '',
      args: [],
    );
  }

  /// `How to play`
  String get howToPlay {
    return Intl.message(
      'How to play',
      name: 'howToPlay',
      desc: '',
      args: [],
    );
  }

  /// `Reset Game`
  String get resetGame {
    return Intl.message(
      'Reset Game',
      name: 'resetGame',
      desc: '',
      args: [],
    );
  }

  /// `A Wordle Puzzle Game`
  String get helpTitle {
    return Intl.message(
      'A Wordle Puzzle Game',
      name: 'helpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Guess the WORDLE in six tries`
  String get helpDesc1 {
    return Intl.message(
      'Guess the WORDLE in six tries',
      name: 'helpDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Each guess must be a valid five-letter word. Hit the enter button to submit`
  String get helpDesc2 {
    return Intl.message(
      'Each guess must be a valid five-letter word. Hit the enter button to submit',
      name: 'helpDesc2',
      desc: '',
      args: [],
    );
  }

  /// `After each guess, the color of the tiles will change to show how close your guess was to the word.`
  String get helpDesc3 {
    return Intl.message(
      'After each guess, the color of the tiles will change to show how close your guess was to the word.',
      name: 'helpDesc3',
      desc: '',
      args: [],
    );
  }

  /// `Example`
  String get example {
    return Intl.message(
      'Example',
      name: 'example',
      desc: '',
      args: [],
    );
  }

  /// `The green tile shows that letter W is in the word and it's in the right spot.`
  String get exampleDesc1 {
    return Intl.message(
      'The green tile shows that letter W is in the word and it\'s in the right spot.',
      name: 'exampleDesc1',
      desc: '',
      args: [],
    );
  }

  /// `The yellow tile shows that letter I is in the word but it's not in the right spot.`
  String get exampleDesc2 {
    return Intl.message(
      'The yellow tile shows that letter I is in the word but it\'s not in the right spot.',
      name: 'exampleDesc2',
      desc: '',
      args: [],
    );
  }

  /// `A grey tile shows the letter is not in the word. For example, V, U, S are not in the word.`
  String get exampleDesc3 {
    return Intl.message(
      'A grey tile shows the letter is not in the word. For example, V, U, S are not in the word.',
      name: 'exampleDesc3',
      desc: '',
      args: [],
    );
  }

  /// `Got it!`
  String get gotIt {
    return Intl.message(
      'Got it!',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Not a word, please try again!`
  String get notWordContent {
    return Intl.message(
      'Not a word, please try again!',
      name: 'notWordContent',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
