import 'package:flutter/material.dart';
import 'package:my_soccer/services/video.dart';
import 'package:my_soccer/util/category.dart';
import 'package:my_soccer/widgets/large_image.dart';

class ComedyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff27cc3b),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Comedy",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: LargeImageWidget(stream: VideoService.getVideos(category: Comedy)),
    );
  }
}
