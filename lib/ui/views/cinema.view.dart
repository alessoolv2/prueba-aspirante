import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_aspirante_flutter/app.localizations.dart';
import 'package:test_aspirante_flutter/controllers/cinema.controller.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';


class CinemaView extends StatefulWidget {
  @override
  _CinemaViewState createState() => _CinemaViewState();
}

class _CinemaViewState extends State<CinemaView> {

  CinemaController controller;
  final Completer<GoogleMapController> _googleMapController = Completer();

  @override
  void didChangeDependencies() {
    controller ??= CinemaController.init(context);

    if (controller.markerLocationIcon == null) {
      final ImageConfiguration imageConfiguration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(imageConfiguration, CinemaController.MARKER).then((value){
        controller.markerLocationIcon = value;
      });
    }
    controller.loadMarkers((Set<Marker> marker){
      setState(() {
        controller.markers = marker;
      });
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[

            //Map
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CinemaController.cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _googleMapController.complete(controller);
              },
              markers: controller.markers,
            ),

            //Title
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white.withOpacity(0.6),
              child: Container(
                margin: const EdgeInsets.only(left: 16.0, bottom: 4.0, top: 16.0),
                child: Text(
                  AppLocalizations.of(context).translate('cinema.title'),
                  style: StyleTheme.theme.textTheme.headline5,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
