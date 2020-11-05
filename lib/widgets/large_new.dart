import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_soccer/models/new.dart';
import 'package:my_soccer/screens/new_detail.dart';
import 'package:my_soccer/services/new.dart';

import 'loading.dart';

class LargeNewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: NewService.getNews(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        }
        if (!snapshot.hasData) {
          return Container();
        } else {
          final List<NewModel> news = snapshot.data.docs
              .map((e) => NewModel.fromQueryDocumentSnapshot(e))
              .toList();

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewDetailScreen(newModel: news[index]),
                      ),
                    );
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Image.network(
                          news[index].imageUrl,
                          height: 200,
                        ),
                        Text(
                          news[index].title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
