// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billboard.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BillboardStore on _BillboardStore, Store {
  final _$billboardViewModelAtom =
      Atom(name: '_BillboardStore.billboardViewModel');

  @override
  BillboardViewModel get billboardViewModel {
    _$billboardViewModelAtom.reportRead();
    return super.billboardViewModel;
  }

  @override
  set billboardViewModel(BillboardViewModel value) {
    _$billboardViewModelAtom.reportWrite(value, super.billboardViewModel, () {
      super.billboardViewModel = value;
    });
  }

  final _$loadBillboardFutureAtom =
      Atom(name: '_BillboardStore.loadBillboardFuture');

  @override
  ObservableFuture<BillboardViewModel> get loadBillboardFuture {
    _$loadBillboardFutureAtom.reportRead();
    return super.loadBillboardFuture;
  }

  @override
  set loadBillboardFuture(ObservableFuture<BillboardViewModel> value) {
    _$loadBillboardFutureAtom.reportWrite(value, super.loadBillboardFuture, () {
      super.loadBillboardFuture = value;
    });
  }

  final _$indexAtom = Atom(name: '_BillboardStore.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$controllerAtom = Atom(name: '_BillboardStore.controller');

  @override
  VideoPlayerController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(VideoPlayerController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$videoUrlAtom = Atom(name: '_BillboardStore.videoUrl');

  @override
  String get videoUrl {
    _$videoUrlAtom.reportRead();
    return super.videoUrl;
  }

  @override
  set videoUrl(String value) {
    _$videoUrlAtom.reportWrite(value, super.videoUrl, () {
      super.videoUrl = value;
    });
  }

  final _$loadVideoFutureAtom = Atom(name: '_BillboardStore.loadVideoFuture');

  @override
  ObservableFuture<dynamic> get loadVideoFuture {
    _$loadVideoFutureAtom.reportRead();
    return super.loadVideoFuture;
  }

  @override
  set loadVideoFuture(ObservableFuture<dynamic> value) {
    _$loadVideoFutureAtom.reportWrite(value, super.loadVideoFuture, () {
      super.loadVideoFuture = value;
    });
  }

  final _$billboardAsyncAction = AsyncAction('_BillboardStore.billboard');

  @override
  Future<BillboardViewModel> billboard(BuildContext context) {
    return _$billboardAsyncAction.run(() => super.billboard(context));
  }

  final _$_BillboardStoreActionController =
      ActionController(name: '_BillboardStore');

  @override
  void setIndex(int value) {
    final _$actionInfo = _$_BillboardStoreActionController.startAction(
        name: '_BillboardStore.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$_BillboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUrl(String url) {
    final _$actionInfo = _$_BillboardStoreActionController.startAction(
        name: '_BillboardStore.setUrl');
    try {
      return super.setUrl(url);
    } finally {
      _$_BillboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetController() {
    final _$actionInfo = _$_BillboardStoreActionController.startAction(
        name: '_BillboardStore.resetController');
    try {
      return super.resetController();
    } finally {
      _$_BillboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getVideo() {
    final _$actionInfo = _$_BillboardStoreActionController.startAction(
        name: '_BillboardStore.getVideo');
    try {
      return super.getVideo();
    } finally {
      _$_BillboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanVideoController() {
    final _$actionInfo = _$_BillboardStoreActionController.startAction(
        name: '_BillboardStore.cleanVideoController');
    try {
      return super.cleanVideoController();
    } finally {
      _$_BillboardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
billboardViewModel: ${billboardViewModel},
loadBillboardFuture: ${loadBillboardFuture},
index: ${index},
controller: ${controller},
videoUrl: ${videoUrl},
loadVideoFuture: ${loadVideoFuture}
    ''';
  }
}
