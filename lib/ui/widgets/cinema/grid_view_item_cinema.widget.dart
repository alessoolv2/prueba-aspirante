import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';

class GridViewItem extends StatelessWidget {

  const GridViewItem({Key key, this.title, this.condition, this.imageUrl, this.onTap, this.mediaLoadImage = 'assets/images/loader_icons/media_load.png', this.imageFit = BoxFit.cover, this.sizeHeight = 0}) : super(key: key);


  final String title;
  final bool condition;
  final String imageUrl;
  final Function onTap;
  final String mediaLoadImage;
  final BoxFit imageFit;
  final double sizeHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 240.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(
                        12.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8.0,
                        color: Colors.black.withOpacity(0.235),
                        offset: const Offset(0.0, 3.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 240.0,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(12.0),
                    child: Image(
                      image: AssetImage(mediaLoadImage),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 2.0,right: 2.0,
                  top: 12, bottom: 0),
              child: Text(
                '$title',
                style: StyleTheme.theme.textTheme.headline4.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
