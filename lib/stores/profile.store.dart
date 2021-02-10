import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/controllers/storage.controller.dart';
import 'package:test_aspirante_flutter/repositories/profile.repository.dart';
import 'package:test_aspirante_flutter/stores/database/profile.database.dart';
import 'package:test_aspirante_flutter/view-models/profile.viewmodel.dart';
import 'locator/locator.store.dart';

part 'profile.store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final ProfileRepository _profileRepository = ProfileRepository();
  final StorageController _storageController = LocatorStore.locator<StorageController>();
  final ProfileDatabase profileDatabase = ProfileDatabase();

  @observable
  ProfileViewModel profileViewModel;

  @observable
  ObservableFuture<ProfileViewModel> loadProfileFuture;

  @action
  Future<ProfileViewModel> profile(BuildContext context) async {
    profileViewModel = ProfileViewModel();
    final Future<ProfileViewModel> result = _profileRepository.profile(context);
    loadProfileFuture = ObservableFuture<ProfileViewModel>(result);
    profileViewModel = await result;
    _storageController.insert(ProfileDatabase.TABLE_NAME, profileViewModel.data.toJson());
    return profileViewModel;
  }

  @action
  Future<ProfileViewModel> localProfile() async {
    profileViewModel = ProfileViewModel();
    final Future<ProfileViewModel> result = profileDatabase.getProfile();
    loadProfileFuture = ObservableFuture<ProfileViewModel>(result);
    profileViewModel = await result;
    return profileViewModel;
  }

}