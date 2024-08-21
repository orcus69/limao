// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManagerStartStore on _ManagerStartStoreBase, Store {
  late final _$pageControllerAtom =
      Atom(name: '_ManagerStartStoreBase.pageController', context: context);

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_ManagerStartStoreBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$_ManagerStartStoreBaseActionController =
      ActionController(name: '_ManagerStartStoreBase', context: context);

  @override
  void setPageController(PageController value) {
    final _$actionInfo = _$_ManagerStartStoreBaseActionController.startAction(
        name: '_ManagerStartStoreBase.setPageController');
    try {
      return super.setPageController(value);
    } finally {
      _$_ManagerStartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPage(int value) {
    final _$actionInfo = _$_ManagerStartStoreBaseActionController.startAction(
        name: '_ManagerStartStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_ManagerStartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
currentPage: ${currentPage}
    ''';
  }
}
