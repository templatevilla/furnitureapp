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

  /// `DEWISH`
  String get dewish {
    return Intl.message(
      'DEWISH',
      name: 'dewish',
      desc: '',
      args: [],
    );
  }

  /// `Explore World Class Top Furnitures.`
  String get exploreWorldClassTopFurnitures {
    return Intl.message(
      'Explore World Class Top Furnitures.',
      name: 'exploreWorldClassTopFurnitures',
      desc: '',
      args: [],
    );
  }

  /// `Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an scrambled it to make a type specimen book.`
  String get loremIpsumHasBeenTheIndustrysStandardDummyTextEver {
    return Intl.message(
      'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an scrambled it to make a type specimen book.',
      name: 'loremIpsumHasBeenTheIndustrysStandardDummyTextEver',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get productDescription {
    return Intl.message(
      'Product Description',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Explore Furniture Collection`
  String get exploreFurnitureCollection {
    return Intl.message(
      'Explore Furniture Collection',
      name: 'exploreFurnitureCollection',
      desc: '',
      args: [],
    );
  }

  /// `10% Off`
  String get off10 {
    return Intl.message(
      '10% Off',
      name: 'off10',
      desc: '',
      args: [],
    );
  }

  /// `Until November 23`
  String get untilNovember23 {
    return Intl.message(
      'Until November 23',
      name: 'untilNovember23',
      desc: '',
      args: [],
    );
  }

  /// `Get Now`
  String get getNow {
    return Intl.message(
      'Get Now',
      name: 'getNow',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
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
