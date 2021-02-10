// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagesStore on _PagesStore, Store {
  final _$currentPageAtom = Atom(name: '_PagesStore.currentPage');

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

  final _$controllerAtom = Atom(name: '_PagesStore.controller');

  @override
  PageController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(PageController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$_PagesStoreActionController = ActionController(name: '_PagesStore');

  @override
  void changePage(int index) {
    final _$actionInfo = _$_PagesStoreActionController.startAction(
        name: '_PagesStore.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_PagesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initController() {
    final _$actionInfo = _$_PagesStoreActionController.startAction(
        name: '_PagesStore.initController');
    try {
      return super.initController();
    } finally {
      _$_PagesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
controller: ${controller}
    ''';
  }
}
