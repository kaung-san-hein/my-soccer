import 'package:flutter/material.dart';

class FeedBackScreen extends StatefulWidget {
  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff27cc3b),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Feedback",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: TextFormField(
                controller: _feedbackController,
                autofocus: true,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "Suggest me!",
                ),
                validator: (String value) {
                  if (value.trim().isEmpty) {
                    return "Please enter something!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RaisedButton(
                color: Color(0xff27cc3b),
                child: Text(
                  "Send",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _feedbackController.clear();
                    print("Send Feedback");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
