import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_soccer/models/video.dart';
import 'package:my_soccer/screens/video_player.dart';
import 'loading.dart';

class SmallImageWidget extends StatelessWidget {
  final Stream stream;

  SmallImageWidget({this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        }
        if (!snapshot.hasData) {
          return Container();
        } else {
          final List<VideoModel> videos = snapshot.data.docs
              .map((e) => VideoModel.fromQueryDocumentSnapshot(e))
              .toList();

          return Container(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 3.0, vertical: 5.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                              videoUrl: videos[index].videoUrl),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              videos[index].thumbnailUrl,
                              width: 300,
                              height: 170,
                            ),
                            Container(
                              width: 300,
                              height: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.01),
                                    Colors.black.withOpacity(0.02),
                                    Colors.black.withOpacity(0.03),
                                    Colors.black.withOpacity(0.04),
                                    Colors.black.withOpacity(0.05),
                                  ],
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.grey[400].withOpacity(0.8),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 28.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          videos[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
