import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'kn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? knText = '',
  }) =>
      [enText, arText, knText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'n2qgpm18': {
      'en': 'Height iframe 250 responsive',
      'ar': '',
      'kn': '',
    },
    '4r1i7drf': {
      'en': 'Home',
      'ar': '',
      'kn': '',
    },
  },
  // AuthenticateSolo1
  {
    'exig3brc': {
      'en': 'Email address..',
      'ar': '',
      'kn': '',
    },
    'r3r82653': {
      'en': 'chethan@vizsoft.in',
      'ar': '',
      'kn': '',
    },
    'kuveogk5': {
      'en': 'Password...',
      'ar': '',
      'kn': '',
    },
    'bf7spdsl': {
      'en': '123456',
      'ar': '',
      'kn': '',
    },
    '5ezqc6cc': {
      'en': 'Signup',
      'ar': '',
      'kn': '',
    },
    'mx2thtsn': {
      'en': 'Signin',
      'ar': '',
      'kn': '',
    },
  },
  // translation
  {
    'nlkvhjvc': {
      'en': 'English',
      'ar': '',
      'kn': '',
    },
    '4stb6ai5': {
      'en': 'Kannada',
      'ar': '',
      'kn': '',
    },
    'xii53bn6': {
      'en': 'Arabic',
      'ar': '',
      'kn': '',
    },
    'gs6m3osx': {
      'en': 'Please select...',
      'ar': '',
      'kn': '',
    },
    '4kp2y9qn': {
      'en': 'Search for an item...',
      'ar': '',
      'kn': '',
    },
    'ipj9vbfx': {
      'en': 'Page Title',
      'ar': 'عنوان الصفحة',
      'kn': 'ಪುಟದ ಶೀರ್ಷಿಕೆ',
    },
    'eo2t9hvd': {
      'en': 'Home',
      'ar': 'بيت',
      'kn': 'ಮನೆ',
    },
  },
  // titleEdit
  {
    'pf6obgop': {
      'en': 'Label here...',
      'ar': '',
      'kn': '',
    },
    'p336jyvy': {
      'en': 'Save',
      'ar': '',
      'kn': '',
    },
  },
  // Miscellaneous
  {
    'kr5h9dmp': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'wlufkc4v': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'um6rhuuv': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'pdgh6ew3': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'mcns7pbu': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'spjzqk1q': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    '8uanku8s': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'rx9aq0h4': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'im8t7zu7': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'wqqsdzkp': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'c9wtb2k2': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    '6zl0vpwj': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'fz5wb55f': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    '8ha0vafn': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'wkuifyqf': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'erk6w14t': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'zoop5ytx': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'pw28ucri': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'vshe7y2e': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'k1pdv0vi': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'eolb629c': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    '6vn9e9gy': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'nh2edrna': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    '2k3u5ls8': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'pm9hiel1': {
      'en': '',
      'ar': '',
      'kn': '',
    },
    'b6xfdwq5': {
      'en': '',
      'ar': '',
      'kn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
