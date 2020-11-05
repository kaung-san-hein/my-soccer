import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_soccer/models/video.dart';
import 'package:my_soccer/screens/splash.dart';
import 'package:my_soccer/services/video.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<VideoModel>>.value(
          initialData: <VideoModel>[],
          value: VideoService.getVideosForSearch(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Soccer App',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
