import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:video_player/video_player.dart';

class PlayPauseOverlay extends StatefulWidget {
  const PlayPauseOverlay({@required this.controller});

  @override
  _PlayPauseOverlayState createState() =>
      _PlayPauseOverlayState(controller: controller);

  final VideoPlayerController controller;
}

class _PlayPauseOverlayState extends State<PlayPauseOverlay> {
  _PlayPauseOverlayState({@required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => controller.value.isPlaying,
      widgetBuilder: (BuildContext context) => GestureDetector(
        onTap: () {
          controller.value.isPlaying ? controller.pause() : controller.play();
          setState(() {});
        },
      ),
      fallbackBuilder: (BuildContext context) => GestureDetector(
        onTap: () {
          controller.value.isPlaying ? controller.pause() : controller.play();
          setState(() {});
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
            controller.value.isPlaying,
            widgetBuilder: (BuildContext context) => const SizedBox.shrink(),
            fallbackBuilder: (BuildContext context) => Container(
              color: Colors.black26,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        controller.value.isPlaying
                            ? controller.pause()
                            : controller.play();
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.seekTo(const Duration(seconds: 0));
                        controller.play();
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.autorenew,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}