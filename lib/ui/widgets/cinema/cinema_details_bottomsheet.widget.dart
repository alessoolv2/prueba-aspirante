import 'package:flutter/material.dart';
import 'package:test_aspirante_flutter/controllers/cinema.controller.dart';
import 'package:test_aspirante_flutter/model/cinemas.model.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';

class CinemaDetailsBottomSheet {
  CinemaDetailsBottomSheet(this.context, this.cinemaModel);

  final BuildContext context;
  final CinemaModel cinemaModel;

  Widget infoSheetDot(double mH, double dotW, double dotH, Color color) {
    return Container(
      padding: EdgeInsets.all(mH * 0.008),
      child: Container(
        width: dotW,
        height: dotH,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
  void show() {
    final double height = MediaQuery.of(context).size.height;
    showModalBottomSheet<void>(
      context: context,
      builder: (builder) {
        return Container(
          height: 220,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 220,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 4, left: 10, right: 10),
                    child: infoSheetDot(height, 33, 6, Colors.white),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 4.8,),
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 6.0, top:6.0, left: 12.0, right: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(CinemaController.MARKER, width: 24.0,),
                                    Container(
                                      margin: const EdgeInsets.only(left: 6.0),
                                        child: Text(cinemaModel.name, style: StyleTheme.theme.textTheme.headline5.copyWith(fontWeight: FontWeight.bold,fontSize: 18.0)),
                                    ),
                                  ],
                                ),
                              ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 6.0, top:6.0, left: 12.0, right: 12.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.phone, color: StyleTheme.primaryColor,),
                                  Container(
                                      margin: const EdgeInsets.only(left: 6.0),
                                      child: Text('${cinemaModel.phone}', style: StyleTheme.theme.textTheme.headline4.copyWith(fontWeight: FontWeight.bold,))),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 6.0, top:6.0, left: 12.0, right: 12.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.navigation, color: StyleTheme.primaryColor,),
                                  Container(
                                      margin: const EdgeInsets.only(left: 6.0),
                                      width: MediaQuery.of(context).size.width-60,
                                      child: Text('${cinemaModel.address}', style: StyleTheme.theme.textTheme.headline4.copyWith(fontWeight: FontWeight.bold,))),
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9.0),
                          topRight: Radius.circular(9.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      backgroundColor: Colors.transparent,
      isDismissible: true,
    );
  }
}