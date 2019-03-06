import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class InstructionsPage extends StatefulWidget {
  @override
  InstructionsPageState createState() {
    return new InstructionsPageState();
  }
}

class InstructionsPageState extends State<InstructionsPage> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    videoPlayerController =
        VideoPlayerController.asset("assets/videos/reversi_instructions.mp4");
    chewieController = ChewieController(
        autoPlay: true,
        autoInitialize: true,
        allowFullScreen: false,
        allowedScreenSleep: false,
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9,
        systemOverlaysAfterFullScreen: []);
  }

  @override
  void dispose() {
    if (videoPlayerController != null || chewieController != null) {
      videoPlayerController.dispose();
      chewieController.dispose();
    }

    

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
      ]);
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        body: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
