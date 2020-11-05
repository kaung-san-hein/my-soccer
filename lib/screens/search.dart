import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_soccer/models/video.dart';
import 'package:my_soccer/screens/video_player.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<VideoModel> _filterVideos = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videos = Provider.of<List<VideoModel>>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff27cc3b),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          autocorrect: false,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            hintText: "Search",
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _filterVideos = [];
                        _searchController.clear();
                      });
                    },
                  )
                : null,
          ),
          onChanged: (_) {
            setState(() {});
          },
          onSubmitted: (String value) {
            if (value.trim().isNotEmpty) {
              _filterVideos = videos
                  .where((video) =>
                      video.title.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            } else {
              _filterVideos = videos;
            }
            setState(() {});
          },
        ),
        elevation: 0,
      ),
      body: _filterVideos.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "No Videos Found",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _filterVideos.length,
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
                              videoUrl: _filterVideos[index].videoUrl),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              _filterVideos[index].thumbnailUrl,
                              width: double.infinity,
                              height: 200,
                            ),
                            Container(
                              height: 200,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${_filterVideos[index].title}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
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
}
