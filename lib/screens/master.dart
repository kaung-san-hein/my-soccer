import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_soccer/screens/feed_back.dart';
import 'package:my_soccer/screens/home.dart';
import 'package:my_soccer/screens/search.dart';
import 'package:my_soccer/screens/setting.dart';
import 'package:my_soccer/services/new.dart';
import 'package:my_soccer/services/video.dart';
import 'package:my_soccer/util/category.dart';
import 'package:my_soccer/widgets/large_image.dart';
import 'package:my_soccer/widgets/large_new.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

List<DrawerItem> drawerItems = [
  DrawerItem("Home", Icons.home),
  DrawerItem("New", Icons.description),
  DrawerItem("Highlight", Icons.play_circle_filled),
  DrawerItem("Match", Icons.play_circle_filled),
  DrawerItem("Goal", Icons.stars),
  DrawerItem("Skill", Icons.play_circle_filled),
  DrawerItem("Comedy", Icons.play_circle_filled),
  DrawerItem("Training", Icons.directions_walk),
];

class Master extends StatefulWidget {
  @override
  _MasterState createState() => _MasterState();
}

class _MasterState extends State<Master> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeScreen();
      case 1:
        return LargeNewWidget();
      case 2:
        return LargeImageWidget(
            stream: VideoService.getVideos(category: Highlight));
      case 3:
        return LargeImageWidget(
            stream: VideoService.getVideos(category: Match));
      case 4:
        return LargeImageWidget(stream: VideoService.getVideos(category: Goal));
      case 5:
        return LargeImageWidget(
            stream: VideoService.getVideos(category: Skill));
      case 6:
        return LargeImageWidget(
            stream: VideoService.getVideos(category: Comedy));
      case 7:
        return LargeImageWidget(
            stream: VideoService.getVideos(category: Training));

      default:
        return Text("Not Found!");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 83, 23, 0),
      items: [
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {},
            child: Text(
              "Refresh",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {},
            child: Text(
              "Favorites",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedBackScreen()),
              );
            },
            child: Text(
              "Feedback",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingScreen()),
              );
            },
            child: Text(
              "Settings",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Padding> drawerOptions = [];
    for (int i = 0; i < drawerItems.length; i++) {
      DrawerItem drawerItem = drawerItems[i];
      drawerOptions.add(
        Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            bottom: 5.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300],
                  width: 1.0,
                ),
              ),
            ),
            child: ListTile(
              leading: Icon(
                drawerItem.icon,
                color: _selectedDrawerIndex == i
                    ? Color(0xff27cc3b)
                    : Colors.black,
                size: 28.0,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: _selectedDrawerIndex == i
                    ? Color(0xff27cc3b)
                    : Colors.black,
                size: 20.0,
              ),
              title: Text(
                drawerItem.title,
                style: TextStyle(
                  color: _selectedDrawerIndex == i
                      ? Color(0xff27cc3b)
                      : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              selected: i == _selectedDrawerIndex,
              onTap: () => _onSelectItem(i),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff27cc3b),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          drawerItems[_selectedDrawerIndex].title,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              _showPopupMenu();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "My Soccer",
                  style: TextStyle(
                    color: Color(0xff27cc3b),
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: SafeArea(
        child: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}
