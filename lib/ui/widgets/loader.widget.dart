import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';

//Generic dialog loader
class Loader {

  static Future<dynamic> show(BuildContext context) {
    return showDialog<dynamic>(
        context: context,
        barrierDismissible: false,
        builder: (_) => _dialogLoadingInfo(context));
  }

  static Widget _dialogLoadingInfo(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: StyleTheme.primaryColor,
          child: Container(
            height: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _circle(),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: _circle(),
                ),
                _circle()
              ],
            ),
          ),
        ),
      ),
    );
  }
  static Widget _circle() {
    return Container(
      width: 13,
      height: 13,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

}