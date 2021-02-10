import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/repositories/cinemas.repository.dart';
import 'package:test_aspirante_flutter/view-models/cinema.viewmodel.dart';

part 'cinema.store.g.dart';

class CinemaStore = _CinemaStore with _$CinemaStore;

abstract class _CinemaStore with Store {
  final CinemasRepository _cinemasRepository = CinemasRepository();

  @observable
  CinemaViewModel cinemaViewModel;
  @observable
  ObservableFuture<CinemaViewModel> loadCinemaFuture;

  @action
  Future<CinemaViewModel> cinemas(BuildContext context) async {
    cinemaViewModel = CinemaViewModel();
    final Future<CinemaViewModel> result = _cinemasRepository.getCinemas(context);
    loadCinemaFuture = ObservableFuture<CinemaViewModel>(result);
    cinemaViewModel = await result;
    return cinemaViewModel;
  }

}