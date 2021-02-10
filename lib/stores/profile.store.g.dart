// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  final _$profileViewModelAtom = Atom(name: '_ProfileStore.profileViewModel');

  @override
  ProfileViewModel get profileViewModel {
    _$profileViewModelAtom.reportRead();
    return super.profileViewModel;
  }

  @override
  set profileViewModel(ProfileViewModel value) {
    _$profileViewModelAtom.reportWrite(value, super.profileViewModel, () {
      super.profileViewModel = value;
    });
  }

  final _$loadProfileFutureAtom = Atom(name: '_ProfileStore.loadProfileFuture');

  @override
  ObservableFuture<ProfileViewModel> get loadProfileFuture {
    _$loadProfileFutureAtom.reportRead();
    return super.loadProfileFuture;
  }

  @override
  set loadProfileFuture(ObservableFuture<ProfileViewModel> value) {
    _$loadProfileFutureAtom.reportWrite(value, super.loadProfileFuture, () {
      super.loadProfileFuture = value;
    });
  }

  final _$profileAsyncAction = AsyncAction('_ProfileStore.profile');

  @override
  Future<ProfileViewModel> profile(BuildContext context) {
    return _$profileAsyncAction.run(() => super.profile(context));
  }

  final _$localProfileAsyncAction = AsyncAction('_ProfileStore.localProfile');

  @override
  Future<ProfileViewModel> localProfile() {
    return _$localProfileAsyncAction.run(() => super.localProfile());
  }

  @override
  String toString() {
    return '''
profileViewModel: ${profileViewModel},
loadProfileFuture: ${loadProfileFuture}
    ''';
  }
}
