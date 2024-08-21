// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_HomeStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$modulesLbrAtom =
      Atom(name: '_HomeStoreBase.modulesLbr', context: context);

  @override
  ObservableList<ModuleModel> get modulesLbr {
    _$modulesLbrAtom.reportRead();
    return super.modulesLbr;
  }

  @override
  set modulesLbr(ObservableList<ModuleModel> value) {
    _$modulesLbrAtom.reportWrite(value, super.modulesLbr, () {
      super.modulesLbr = value;
    });
  }

  late final _$getModulesAsyncAction =
      AsyncAction('_HomeStoreBase.getModules', context: context);

  @override
  Future<void> getModules() {
    return _$getModulesAsyncAction.run(() => super.getModules());
  }

  late final _$addExpenseAsyncAction =
      AsyncAction('_HomeStoreBase.addExpense', context: context);

  @override
  Future<void> addExpense() {
    return _$addExpenseAsyncAction.run(() => super.addExpense());
  }

  late final _$updateExpenseAsyncAction =
      AsyncAction('_HomeStoreBase.updateExpense', context: context);

  @override
  Future<void> updateExpense(ModuleModel expense) {
    return _$updateExpenseAsyncAction.run(() => super.updateExpense(expense));
  }

  late final _$deleteExpenseAsyncAction =
      AsyncAction('_HomeStoreBase.deleteExpense', context: context);

  @override
  Future<void> deleteExpense(int id) {
    return _$deleteExpenseAsyncAction.run(() => super.deleteExpense(id));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
modulesLbr: ${modulesLbr}
    ''';
  }
}
