// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppLanguageStore on _AppLanguageStoreBase, Store {
  late final _$appLocaleAtom =
      Atom(name: '_AppLanguageStoreBase.appLocale', context: context);

  @override
  Locale get appLocale {
    _$appLocaleAtom.reportRead();
    return super.appLocale;
  }

  @override
  set appLocale(Locale value) {
    _$appLocaleAtom.reportWrite(value, super.appLocale, () {
      super.appLocale = value;
    });
  }

  late final _$changeLanguageAsyncAction =
      AsyncAction('_AppLanguageStoreBase.changeLanguage', context: context);

  @override
  Future<void> changeLanguage(Locale type) {
    return _$changeLanguageAsyncAction.run(() => super.changeLanguage(type));
  }

  @override
  String toString() {
    return '''
appLocale: ${appLocale}
    ''';
  }
}
