import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by flappy_translator package
/// You should never change something directly in this file but, instead, generate new file when needed with the package
class I18n {
  String get good_morning => _getText("good_morning");

String get lets_play => _getText("lets_play");

String get easy => _getText("easy");

String get medium => _getText("medium");

String get hard => _getText("hard");

String get easy_description => _getText("easy_description");

String get medium_description => _getText("medium_description");

String get hard_description => _getText("hard_description");

String get search_hint => _getText("search_hint");



  I18n(Locale locale) {
    this._locale = locale;
     _localizedValues = null;
  }

  Locale _locale;

  static Map<String, String> _localizedValues;

        
static Map<String, String> _enValues = {
              "good_morning": "Good morning,",
                "lets_play": "Let's play !",
                "easy": "Easy",
                "medium": "Medium",
                "hard": "Hard",
                "easy_description": "One question, two choices",
                "medium_description": "One question, four choices",
                "hard_description": "One question, type the answer",
                "search_hint": "Search",
        };
    static Map<String, Map<String, String>> _allValues = {
            "en": _enValues,
      };

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  String _getText(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<I18n> load(Locale locale) async {
    I18n translations = new I18n(locale);
    _localizedValues = _allValues[locale.toString()];
    return translations;
  }

  get currentLanguage => _locale.languageCode;
}

class I18nDelegate extends LocalizationsDelegate<I18n> {
  const I18nDelegate();

  static final Set<Locale> supportedLocals = { Locale('en'), };
      
      @override
      bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);

  @override
  bool shouldReload(I18nDelegate old) => false;
}
