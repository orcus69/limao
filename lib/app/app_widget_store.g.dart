// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppWidgetStore on _AppWidgetStoreBase, Store {
  late final _$isDarkAtom =
      Atom(name: '_AppWidgetStoreBase.isDark', context: context);

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  late final _$_AppWidgetStoreBaseActionController =
      ActionController(name: '_AppWidgetStoreBase', context: context);

  @override
  dynamic setContext(BuildContext value) {
    final _$actionInfo = _$_AppWidgetStoreBaseActionController.startAction(
        name: '_AppWidgetStoreBase.setContext');
    try {
      return super.setContext(value);
    } finally {
      _$_AppWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme() {
    final _$actionInfo = _$_AppWidgetStoreBaseActionController.startAction(
        name: '_AppWidgetStoreBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_AppWidgetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDark: ${isDark}
    ''';
  }
}
