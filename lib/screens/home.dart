import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_soccer/models/new.dart';
import 'package:my_soccer/screens/comedy.dart';
import 'package:my_soccer/screens/goal.dart';
import 'package:my_soccer/screens/highlight.dart';
import 'package:my_soccer/screens/match.dart';
import 'package:my_soccer/screens/new.dart';
import 'package:my_soccer/screens/skill.dart';
import 'package:my_soccer/screens/training.dart';
import 'package:my_soccer/services/new.dart';
import 'package:my_soccer/services/video.dart';
import 'package:my_soccer/util/category.dart';
import 'package:my_soccer/widgets/label_bar.dart';
import 'package:my_soccer/widgets/loading.dart';
import 'package:my_soccer/widgets/small_image.dart';

import 'new_detail.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // latest new
        LabelBarWidget(
          label: "Latest news",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewScreen(),
              ),
            );
          },
        ),
        StreamBuilder<QuerySnapshot>(
          stream: NewService.getLatestNew(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            }
            if (!snapshot.hasData) {
              return Container();
            } else {
              final List<NewModel> news = snapshot.data.docs
                  .map((e) => NewModel.fromQueryDocumentSnapshot(e))
                  .toList();

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewDetailScreen(newModel: news[0]),
                    ),
                  );
                },
                child: Container(
                  child: Column(
                    children: [
                      Image.network(
                        news[0].imageUrl,
                        width: double.infinity,
                        height: 200,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          news[0].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),

        // highlight
        SizedBox(height: 13.0),
        LabelBarWidget(
          label: "Highlight",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HighlightScreen(),
              ),
            );
          },
        ),
        SmallImageWidget(stream: VideoService.getVideos(category: Highlight)),

        // match
        SizedBox(height: 10.0),
        LabelBarWidget(
          label: "Match",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MatchScreen(),
              ),
            );
          },
        ),
        SmallImageWidget(stream: VideoService.getVideos(category: Match)),

        // Goal
        SizedBox(height: 10.0),
        LabelBarWidget(
          label: "Goal",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GoalScreen(),
              ),
            );
          },
        ),
        SmallImageWidget(stream: VideoService.getVideos(category: Goal)),

        // Skill
        SizedBox(height: 10.0),
        LabelBarWidget(
          label: "Skill",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SkillScreen(),
              ),
            );
          },
        ),
        SmallImageWidget(stream: VideoService.getVideos(category: Skill)),

        // Comedy
        SizedBox(height: 10.0),
        LabelBarWidget(
          label: "Comedy",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ComedyScreen(),
              ),
            );
          },
        ),
        SmallImageWidget(stream: VideoService.getVideos(category: Comedy)),

        // Training
        SizedBox(height: 10.0),
        LabelBarWidget(
          label: "Training",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrainingScreen(),
              ),
            );
          },
        ),
        SmallImageWidget(stream: VideoService.getVideos(category: Training)),
      ],
    );
  }
}
