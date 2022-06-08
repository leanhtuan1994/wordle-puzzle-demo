part of 'language_cubit.dart';

class LanguageState extends Equatable {
  const LanguageState({required this.language});

  final String language;

  @override
  List<Object> get props => [language];

  LanguageState copyWith({
    String? language,
  }) {
    return LanguageState(
      language: language ?? this.language,
    );
  }
}
