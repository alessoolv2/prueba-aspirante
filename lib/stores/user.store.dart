import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/stores/database/user.database.dart';
import 'package:test_aspirante_flutter/view-models/login.viewmodel.dart';

part 'user.store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserDatabase userDatabase = UserDatabase();

  @observable
  LoginViewModel loginViewModel;

  @observable
  ObservableFuture<LoginViewModel> loadLoginFuture;

  @action
  Future<LoginViewModel> user() async {
    loginViewModel = LoginViewModel();
    final Future<LoginViewModel> result = userDatabase.getUser();
    loadLoginFuture = ObservableFuture<LoginViewModel>(result);
    loginViewModel = await result;
    return loginViewModel;
  }

  @action
  void deleteUser() {
    userDatabase.deleteUser();
  }

}