// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$loginViewModelAtom = Atom(name: '_LoginStore.loginViewModel');

  @override
  LoginViewModel get loginViewModel {
    _$loginViewModelAtom.reportRead();
    return super.loginViewModel;
  }

  @override
  set loginViewModel(LoginViewModel value) {
    _$loginViewModelAtom.reportWrite(value, super.loginViewModel, () {
      super.loginViewModel = value;
    });
  }

  final _$loadLoginFutureAtom = Atom(name: '_LoginStore.loadLoginFuture');

  @override
  ObservableFuture<LoginViewModel> get loadLoginFuture {
    _$loadLoginFutureAtom.reportRead();
    return super.loadLoginFuture;
  }

  @override
  set loadLoginFuture(ObservableFuture<LoginViewModel> value) {
    _$loadLoginFutureAtom.reportWrite(value, super.loadLoginFuture, () {
      super.loadLoginFuture = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStore.login');

  @override
  Future<LoginViewModel> login(LoginModel model) {
    return _$loginAsyncAction.run(() => super.login(model));
  }

  @override
  String toString() {
    return '''
loginViewModel: ${loginViewModel},
loadLoginFuture: ${loadLoginFuture}
    ''';
  }
}
