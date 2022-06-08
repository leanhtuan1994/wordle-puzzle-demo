// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "example": MessageLookupByLibrary.simpleMessage("Example"),
        "exampleDesc1": MessageLookupByLibrary.simpleMessage(
            "The green tile shows that letter W is in the word and it\'s in the right spot."),
        "exampleDesc2": MessageLookupByLibrary.simpleMessage(
            "The yellow tile shows that letter I is in the word but it\'s not in the right spot."),
        "exampleDesc3": MessageLookupByLibrary.simpleMessage(
            "A grey tile shows the letter is not in the word. For example, V, U, S are not in the word."),
        "gameTitle": MessageLookupByLibrary.simpleMessage("WORDLE"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Got it!"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello"),
        "helpDesc1": MessageLookupByLibrary.simpleMessage(
            "Guess the WORDLE in six tries"),
        "helpDesc2": MessageLookupByLibrary.simpleMessage(
            "Each guess must be a valid five-letter word. Hit the enter button to submit"),
        "helpDesc3": MessageLookupByLibrary.simpleMessage(
            "After each guess, the color of the tiles will change to show how close your guess was to the word."),
        "helpTitle":
            MessageLookupByLibrary.simpleMessage("A Wordle Puzzle Game"),
        "howToPlay": MessageLookupByLibrary.simpleMessage("How to play"),
        "info": MessageLookupByLibrary.simpleMessage("Info"),
        "lostGameContent": MessageLookupByLibrary.simpleMessage(
            "LOST, PLEASE TRY TO PLAY AGAIN"),
        "newGame": MessageLookupByLibrary.simpleMessage("NEW GAME"),
        "notWordContent": MessageLookupByLibrary.simpleMessage(
            "Not a word, please try again!"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "resetGame": MessageLookupByLibrary.simpleMessage("Reset Game"),
        "won": MessageLookupByLibrary.simpleMessage("WON")
      };
}
