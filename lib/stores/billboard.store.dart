import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/controllers/storage.controller.dart';
import 'package:test_aspirante_flutter/repositories/billboard.repository.dart';
import 'package:test_aspirante_flutter/view-models/billboard.viewmodel.dart';
import 'package:video_player/video_player.dart';
import 'locator/locator.store.dart';

part 'billboard.store.g.dart';

class BillboardStore = _BillboardStore with _$BillboardStore;

abstract class _BillboardStore with Store {
  final BillboardRepository _billboardRepository = BillboardRepository();
  @observable
  BillboardViewModel billboardViewModel;

  @observable
  ObservableFuture<BillboardViewModel> loadBillboardFuture;

  @observable
  int index = -1;

  @observable
  VideoPlayerController controller;

  @observable
  String videoUrl = '';

  @observable
  ObservableFuture loadVideoFuture;

  @action
  void setIndex(int value) {
    index = value;
  }

  @action
  void setUrl(String url) {
    videoUrl = url;
  }

  @action
  void resetController() {
    if (controller != null) {
      controller.setLooping(false);
      controller.pause();
    }
  }

  @action
  Future<BillboardViewModel> billboard(BuildContext context) async {
    billboardViewModel = BillboardViewModel();
    final Future<BillboardViewModel> result = _billboardRepository.getBillboard(context);
    loadBillboardFuture = ObservableFuture<BillboardViewModel>(result);
    billboardViewModel = await result;
  //  _storageController.insert(ProfileDatabase.TABLE_NAME, billboardViewModel.data.toJson());
    return billboardViewModel;
  }

  @action
  void getVideo() {
    controller = VideoPlayerController.network(
      videoUrl,
    );
    final Future<void> initializeVideoPlayerFuture = controller.initialize();
    loadVideoFuture = ObservableFuture<void>(initializeVideoPlayerFuture);
    //controller.setLooping(true);
    controller.play();
    //return initializeVideoPlayerFuture;
  }

  @action
  void cleanVideoController() {
    loadVideoFuture = null;
    controller = null;
    videoUrl = '';
  }



}