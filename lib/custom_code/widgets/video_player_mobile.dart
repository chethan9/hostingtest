// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerMobile extends StatefulWidget {
  const VideoPlayerMobile({
    Key? key,
    this.width,
    this.height,
    this.url,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? url;

  @override
  _VideoPlayerMobileState createState() => _VideoPlayerMobileState();
}

class _VideoPlayerMobileState extends State<VideoPlayerMobile> {
  FlickManager? flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url!),
    );
  }

  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(0, 255, 255, 255),
        child: FlickVideoPlayer(
          flickManager: flickManager!,
          flickVideoWithControls: const FlickVideoWithControls(
            controls: FlickPortraitControls(),
            videoFit: BoxFit.contain,
            backgroundColor: Colors.black,
          ),
          flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
            videoFit: BoxFit.contain,
            backgroundColor: Colors.black,
          ),
        ),
      )
    ]);
  }
}
