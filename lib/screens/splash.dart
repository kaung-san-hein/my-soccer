import 'package:flutter/material.dart';
import 'package:my_soccer/screens/master.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToMaster();
    super.initState();
  }

  void _navigateToMaster() async {
    await Future.delayed(Duration(seconds: 3), () {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Master()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: Color(0xff27cc3b),
          width: double.infinity,
          height: double.infinity,
          child: Text(
            "MySoccer",
            style: TextStyle(
              color: Colors.white,
              fontSize: 43.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
