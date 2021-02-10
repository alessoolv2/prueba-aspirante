import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
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

  static String imageUrl(String image) => '${Settings.MEDIA_URL}$image';

  static String _imageUrlLarge(String image) => '${Settings.MEDIA_URL_LARGE}$image';

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

  Future<void> shareMovie() async {
    billboardStore.resetController();
    try {
      final HttpClientRequest request = await HttpClient().getUrl(Uri.parse(_imageUrlLarge(movie.media[0].resource)));
      final HttpClientResponse response = await request.close();
      final Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      await Share.file(movie.name, "${movie.name.replaceAll(' ', '_')}.jpg", bytes, 'image/jpg');
    } catch (e) {
      print('error: $e');
    }
  }

}