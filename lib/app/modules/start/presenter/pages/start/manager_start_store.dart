import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'manager_start_store.g.dart';

class ManagerStartStore = _ManagerStartStoreBase with _$ManagerStartStore;

abstract class _ManagerStartStoreBase with Store {
  @observable
  PageController pageController = PageController(keepPage: true);

  @action
  void setPageController(PageController value) => pageController = value;

  @observable
  int currentPage = 0;

  @action
  void setCurrentPage(int value) => currentPage = value;
}
