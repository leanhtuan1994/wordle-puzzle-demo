import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/app_repository.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final String language;
  final AppRepository repository;

  LanguageCubit({required this.repository, required this.language})
      : super(LanguageState(language: language));

  void updateLanguage({required String newLang}) async {
    repository.setLanguageCode(lang: newLang);
    emit(state.copyWith(language: newLang));
  }
}
