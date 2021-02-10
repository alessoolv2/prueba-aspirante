import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';

//Loader item settings
class ShimmerItemSettings extends StatelessWidget {
  const ShimmerItemSettings({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        margin: const EdgeInsets.only(left: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                '$title:',
                style: StyleTheme.theme.textTheme.headline4,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              color: Colors.red,
              height: 25.0,
            ),
            const Divider(
              height: 2,
              color: StyleTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
