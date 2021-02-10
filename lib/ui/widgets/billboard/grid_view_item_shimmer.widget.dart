import 'package:flutter/material.dart';

class GridViewItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 240.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.circular(12.0),
            ),
          ),
        ],
      ),
    );
  }
}