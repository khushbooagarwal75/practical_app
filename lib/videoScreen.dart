import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class Videoscreen extends StatefulWidget {
  const Videoscreen({super.key});

  @override
  State<Videoscreen> createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  late VideoPlayerController controller;
  bool isFullscreen = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.shutterstock.com/shutterstock/videos/1061449648/preview/stock-footage-relax-on-an-empty-sea-beach-travel-to-the-paradise-sea-beach-the-dominican-republic-beaches.webm'))
      ..initialize().then((_) {
        controller.play();
        controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleFullscreen() {
    setState(() {
      isFullscreen = !isFullscreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Stack(
            children: [
              controller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: isFullscreen
                    ? MediaQuery.of(context).size.aspectRatio
                    : controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
                  : const Center(child: CircularProgressIndicator()),
              Positioned(
                bottom: 0,
                right:0,
                left:0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    IconButton(

                  onPressed: () {
                    setState(() {
                    if (controller.value.isPlaying) {
                    controller.pause();
                    } else {
                    controller.play();
                    }
                    });
                    }, icon:  Icon(
                      color: Colors.black,
                      controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                      IconButton(
                        onPressed: toggleFullscreen,
                        icon: Icon(
                          color: Colors.black,
                          isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        ),
                      ),
                      IconButton(onPressed: () {
                        // Share.shareUri(uri)
                      }, icon: Icon( color: Colors.black,Icons.share)),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   bottom: isFullscreen ? 20 : 10, // Adjusted for fullscreen mode
              //   left: isFullscreen ? 210 : 260,
              //   right: isFullscreen ? 70 : 70,
              //   child: FloatingActionButton(
              //     onPressed: () {
              //       setState(() {
              //         if (controller.value.isPlaying) {
              //           controller.pause();
              //         } else {
              //           controller.play();
              //         }
              //       });
              //     },
              //     child: Icon(
              //       controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              //     ),
              //   ),
              // ),
              // Positioned(
              //   bottom: isFullscreen ? 20 : 10, // Adjusted for fullscreen mode
              //   left: isFullscreen ? 280 : 340,
              //   right: isFullscreen ? 10 : 0,
              //   // top: 160,
              //   // left: 320,
              //   // right: 10,
              //   child: FloatingActionButton(
              //     onPressed: toggleFullscreen,
              //     child: Icon(
              //       isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
              //     ),
              //   ),
              // ),
              // Positioned(
              //   right: 150,
              //   bottom: 20,
              //   child: IconButton(onPressed: () {
              //     // Share.shareUri(uri)
              //   }, icon: Icon(Icons.share)),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
