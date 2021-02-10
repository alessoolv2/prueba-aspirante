import 'package:flutter/material.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';

class ItemSettings extends StatelessWidget {

  const ItemSettings({Key key, @required this.text, @required this.title, @required this.icon}) : super(key: key);

  final String text;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Row(
                children: [

                  Text(
                    '$text',
                    style: StyleTheme.theme.textTheme.headline4.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),
                  Icon(icon,
                  color: StyleTheme.textColor,),
                ],
              ),
            ),
            const Divider(
              height: 2,
              color: StyleTheme.primaryColor,
            ),
          ],
        )
    );
  }
}