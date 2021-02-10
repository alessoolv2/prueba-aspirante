import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_aspirante_flutter/model/cinemas.model.dart';
import 'package:test_aspirante_flutter/stores/cinema.store.dart';
import 'package:test_aspirante_flutter/ui/widgets/cinema/cinema_details_bottomsheet.widget.dart';
import 'package:test_aspirante_flutter/view-models/cinema.viewmodel.dart';

class CinemaController {
  CinemaController(this.context, this.cinemaStore);
  
  factory CinemaController.init(BuildContext context) => CinemaController(context, Provider.of<CinemaStore>(context));

  static const String MARKER = 'assets/images/cinema.png';

  final BuildContext context;
  final CinemaStore cinemaStore;
  BitmapDescriptor markerLocationIcon;
  Set<Marker> markers = Set<Marker>();



  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(19.702018, -101.192326),
    zoom: 13.0,
  );

  Future<CinemaViewModel> getCinemas() => cinemaStore.cinemas(context);

  Future<void> loadMarkers(Function complete) async {
    final CinemaViewModel cinemaViewModel = await getCinemas();
    final Set<Marker> newMarkers = Set<Marker>();
    if(cinemaViewModel.success){
      final List<CinemaModel> cinemaModels = cinemaViewModel.data;
      for(final CinemaModel model in cinemaModels){
        newMarkers.add(
          Marker(
              markerId: MarkerId(model.id.toString()),
              position: LatLng(double.parse(model.lat), double.parse(model.lng)),
              icon: markerLocationIcon,
              onTap: () {
                print(model.id);
                CinemaDetailsBottomSheet(context,model).show();
              }
          ),
        );
      }
      complete(newMarkers);
    }
  }

}