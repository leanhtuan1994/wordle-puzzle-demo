part of '../config.dart';

class Configurations {
  static String _baseUrl = DefaultConfig.baseUrl;

  static String _defaultLanguage = DefaultConfig.defaultLanguage;

  static String get baseUrl => _baseUrl;

  static String get defaultLanguage => _defaultLanguage;

  void setConfigurationValues(Map<String, dynamic> value) {
    _baseUrl = value['baseUrl'] ?? DefaultConfig.baseUrl;
    _defaultLanguage =
        value['defaultLanguage'] ?? DefaultConfig.defaultLanguage;
  }
}
