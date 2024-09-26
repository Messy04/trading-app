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

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `CRYPTO LIST`
  String get cryptoTitle {
    return Intl.message(
      'CRYPTO LIST',
      name: 'cryptoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Trading App`
  String get tradingApp {
    return Intl.message(
      'Trading App',
      name: 'tradingApp',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get dollarSymbol {
    return Intl.message(
      '\$',
      name: 'dollarSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Process Completed`
  String get processCompleted {
    return Intl.message(
      'Process Completed',
      name: 'processCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, Please try after sometime.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong, Please try after sometime.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Unable to establish a connection`
  String get unableToConnect {
    return Intl.message(
      'Unable to establish a connection',
      name: 'unableToConnect',
      desc: '',
      args: [],
    );
  }

  /// `Request timeout`
  String get requestTimeout {
    return Intl.message(
      'Request timeout',
      name: 'requestTimeout',
      desc: '',
      args: [],
    );
  }

  /// `ERROR`
  String get errorTitle {
    return Intl.message(
      'ERROR',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
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
