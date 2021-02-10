import 'package:flutter/material.dart';
import 'package:test_aspirante_flutter/controllers/billboard.controller.dart';
import 'package:test_aspirante_flutter/ui/widgets/play_pause_overlat.widget.dart';
import 'package:video_player/video_player.dart';

//Video widget
class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  BillboardController billboardController;

  @override
  void didChangeDependencies() {
    billboardController ??= BillboardController.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          VideoPlayer(billboardController.billboardStore.controller),
          PlayPauseOverlay(controller: billboardController.billboardStore.controller),
          VideoProgressIndicator(billboardController.billboardStore.controller, allowScrubbing: true),
        ],
      ),
    );
  }
}
