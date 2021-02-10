import 'package:get_it/get_it.dart';
import 'package:test_aspirante_flutter/controllers/storage.controller.dart';

class LocatorStore {
  static GetIt locator = GetIt.instance;

  static void setupLocator(){
    locator.registerSingleton<StorageController>(StorageController(), signalsReady: true);
  }





}