import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/controllers/storage.controller.dart';
import 'package:test_aspirante_flutter/model/login.model.dart';
import 'package:test_aspirante_flutter/repositories/login.repository.dart';
import 'package:test_aspirante_flutter/stores/locator/locator.store.dart';
import 'package:test_aspirante_flutter/view-models/login.viewmodel.dart';


part 'login.store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final LoginRepository _loginRepository = LoginRepository();
  final StorageController _storageController = LocatorStore.locator<StorageController>();

  @observable
  LoginViewModel loginViewModel;

  @observable
  ObservableFuture<LoginViewModel> loadLoginFuture;

  @action
  Future<LoginViewModel> login(LoginModel model) async {
    loginViewModel = LoginViewModel();
    final Future<LoginViewModel> result = _loginRepository.login(model);
    loadLoginFuture = ObservableFuture<LoginViewModel>(result);
    loginViewModel = await result;
    _storageController.insert('user', loginViewModel.data.toJson());
    return loginViewModel;
  }



}