// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CinemaStore on _CinemaStore, Store {
  final _$cinemaViewModelAtom = Atom(name: '_CinemaStore.cinemaViewModel');

  @override
  CinemaViewModel get cinemaViewModel {
    _$cinemaViewModelAtom.reportRead();
    return super.cinemaViewModel;
  }

  @override
  set cinemaViewModel(CinemaViewModel value) {
    _$cinemaViewModelAtom.reportWrite(value, super.cinemaViewModel, () {
      super.cinemaViewModel = value;
    });
  }

  final _$loadCinemaFutureAtom = Atom(name: '_CinemaStore.loadCinemaFuture');

  @override
  ObservableFuture<CinemaViewModel> get loadCinemaFuture {
    _$loadCinemaFutureAtom.reportRead();
    return super.loadCinemaFuture;
  }

  @override
  set loadCinemaFuture(ObservableFuture<CinemaViewModel> value) {
    _$loadCinemaFutureAtom.reportWrite(value, super.loadCinemaFuture, () {
      super.loadCinemaFuture = value;
    });
  }

  final _$cinemasAsyncAction = AsyncAction('_CinemaStore.cinemas');

  @override
  Future<CinemaViewModel> cinemas(BuildContext context) {
    return _$cinemasAsyncAction.run(() => super.cinemas(context));
  }

  @override
  String toString() {
    return '''
cinemaViewModel: ${cinemaViewModel},
loadCinemaFuture: ${loadCinemaFuture}
    ''';
  }
}
