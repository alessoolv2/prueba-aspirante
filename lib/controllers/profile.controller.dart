import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aspirante_flutter/model/login_response.model.dart';
import 'package:test_aspirante_flutter/model/profile.model.dart';
import 'package:test_aspirante_flutter/router/navigation.router.dart';
import 'package:test_aspirante_flutter/router/routes.router.dart';
import 'package:test_aspirante_flutter/stores/profile.store.dart';
import 'package:test_aspirante_flutter/stores/user.store.dart';
import 'package:test_aspirante_flutter/view-models/login.viewmodel.dart';
import 'package:test_aspirante_flutter/view-models/profile.viewmodel.dart';

class ProfileController {
  ProfileController(this.context, this.userStore, this.profileStore);

  factory ProfileController.init(BuildContext context) =>
      ProfileController(context, Provider.of<UserStore>(context),
          Provider.of<ProfileStore>(context));
  final BuildContext context;
  final UserStore userStore;
  final ProfileStore profileStore;
  final NavigatorRouter navigatorRouter = NavigatorRouter();

  Future<LoginViewModel> get user => userStore.user();

  Future<ProfileViewModel> get profileData {
    if (profileStore.profileViewModel == null) {
      profileStore.profile(context);
    } else {
      profileStore.localProfile();
    }
  }

  LoginResponseModel userModel() {
    return userStore.loginViewModel.data;
  }

  ProfileModel profileModel() {
    return profileStore.profileViewModel.data;
  }

  String get fullName => '${profileModel().firstName} ${profileModel().lastName}';

  void logout(){
    userStore.deleteUser();
    navigatorRouter.goPage(RoutesRouter.SPLASH_SCREEN);
  }
}