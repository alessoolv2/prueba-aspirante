import 'package:flutter/material.dart';

import 'package:test_aspirante_flutter/themes/style.theme.dart';

//Item for cinema label
class ItemDetailsCinema extends StatelessWidget {

  const ItemDetailsCinema({Key key, @required this.text, @required this.title}) : super(key: key);

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only( bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                '$title:',
                style: StyleTheme.theme.textTheme.headline4,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: Text(
                '$text',
                style: StyleTheme.theme.textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),

          ],
        )
    );
  }
}