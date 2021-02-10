import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:mobx/mobx.dart';

part 'pages.store.g.dart';

class PagesStore = _PagesStore with _$PagesStore;

abstract class _PagesStore with Store {

  @observable
  int currentPage = 0;

  @observable
  PageController controller;

  @observable
  LiquidController liquidController;

  @action
  void changePage(int index) {
    currentPage = index;
    //liquidController.animateToPage(page: index);


  }

  @action
  void initController() {
    controller = PageController(
      initialPage: currentPage,
    );
    liquidController = LiquidController();
  }


}