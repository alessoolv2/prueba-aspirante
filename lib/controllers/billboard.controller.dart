import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aspirante_flutter/model/billboard.model.dart';
import 'package:test_aspirante_flutter/router/navigation.router.dart';
import 'package:test_aspirante_flutter/router/routes.router.dart';
import 'package:test_aspirante_flutter/settings.dart';
import 'package:test_aspirante_flutter/stores/billboard.store.dart';
import 'package:test_aspirante_flutter/view-models/billboard.viewmodel.dart';

class BillboardController {
  BillboardController(this.context, this.billboardStore, );

  factory BillboardController.init(BuildContext context) => BillboardController(context, Provider.of<BillboardStore>(context));

  final BuildContext context;
  final BillboardStore billboardStore;
  final NavigatorRouter navigatorRouter = NavigatorRouter();

  Future<BillboardViewModel> getBillboard() => billboardStore.billboard(context);

  Movie movie;

  void goDetails(int index){
    billboardStore.setIndex(index);
  }

  void goBack() {
    billboardStore.resetController();
    billboardStore.setIndex(-1);
  }

  void getMedia({@required String url}) {
    url = '${Settings.VIDEO_URL}$url';
    if(url != billboardStore.videoUrl){
      billboardStore.setUrl(url);
      billboardStore.getVideo();
    }
  }


  Movie getMovie() {
    final int index = billboardStore.index;
    final List<Movie> movies = billboardStore.billboardViewModel.data.movies;
    if(index != -1) {
      movie = movies[index];
    }
    else {
      movie =  movies[0];
    }

  }

}