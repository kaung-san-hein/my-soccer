import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network(widget.videoUrl),
        aspectRatio: 16 / 9,
        autoInitialize: true,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, message) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _chewieController.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black54,
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }
}
