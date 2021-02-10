import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/app.localizations.dart';
import 'package:test_aspirante_flutter/controllers/billboard.controller.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';
import 'package:test_aspirante_flutter/ui/widgets/item_details_cinema.widget.dart';
import 'package:test_aspirante_flutter/ui/widgets/media/loader_media.widget.dart';
import 'package:test_aspirante_flutter/ui/widgets/media/video.widget.dart';

class MovieDetailsView extends StatefulWidget {
  @override
  _MovieDetailsViewState createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  BillboardController billboardController;

  @override
  void didChangeDependencies() {
    billboardController ??= BillboardController.init(context);

    if(billboardController.billboardStore.billboardViewModel == null){
      billboardController.getBillboard();
    }
    billboardController.getMovie();
    billboardController.getMedia(url: billboardController.movie.media[2].resource);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        billboardController.goBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        //AppBar
        appBar: AppBar(
          backgroundColor: StyleTheme.primaryColor,
          title: Text(AppLocalizations.of(context).translate('movieDetails.title')),

          //BackButton
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              billboardController.goBack();
            },
          ),
          //ShareButton
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: billboardController.shareMovie,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //Video media
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: Observer(builder: (_) => ConditionalSwitch.single<FutureStatus>(
                      context: context,
                      valueBuilder: (BuildContext context) => billboardController.billboardStore.loadVideoFuture.status,
                      caseBuilders: {
                        FutureStatus.pending: (BuildContext context) => LoaderMedia(),
                        FutureStatus.fulfilled:(BuildContext context) => Video(),
                        },
                      fallbackBuilder: (BuildContext context) => LoaderMedia(),
                      )
                  ),
                ),

                //Name label
                ItemDetailsCinema(
                  title: AppLocalizations.of(context).translate('movieDetails.name'),
                  text: '${billboardController.movie.name}',
                ),

                //Rating label
                ItemDetailsCinema(
                  title:  AppLocalizations.of(context).translate('movieDetails.rating'),
                  text: '${billboardController.movie.rating}',
                ),

                //Genre label
                ItemDetailsCinema(
                  title:  AppLocalizations.of(context).translate('movieDetails.genre'),
                  text: '${billboardController.movie.genre}',
                ),

                //Length label
                ItemDetailsCinema(
                  title:  AppLocalizations.of(context).translate('movieDetails.length'),
                  text: '${billboardController.movie.length}',
                ),

                //Synopsis label
                ItemDetailsCinema(
                  title:  AppLocalizations.of(context).translate('movieDetails.synopsis'),
                  text: '${billboardController.movie.synopsis}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}