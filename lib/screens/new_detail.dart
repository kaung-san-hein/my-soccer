import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_soccer/models/new.dart';

class NewDetailScreen extends StatelessWidget {
  final NewModel newModel;

  NewDetailScreen({this.newModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff27cc3b),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "New Detail",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Image.network(
            newModel.imageUrl,
            width: double.infinity,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              newModel.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              newModel.description,
              style: TextStyle(
                height: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
