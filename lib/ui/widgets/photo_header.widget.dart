import 'package:flutter/material.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';

class PhotoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 30),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          // photo
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12, width: 2),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child:  const Icon(
                Icons.account_circle,
                color: StyleTheme.primaryColor,
                size: 86.0,
              ),
              ),
            ),

        ],
      ),
    );
  }
}
