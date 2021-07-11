import 'dart:convert';

import 'package:anime_wallpapers_app/data/category_data.dart';
import 'package:anime_wallpapers_app/models/wallpaper_model.dart';
import 'package:anime_wallpapers_app/widgets/title_name.dart';
import 'package:anime_wallpapers_app/widgets/wallpaper_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class CategoriesScreen extends StatefulWidget {
  final String categoryName;
  CategoriesScreen(this.categoryName);
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<WallpaperModel> wallpapers = [];
  getSearchWallpaper(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=15'),
        headers: {'Authorization': CategoryData.apiKey});
    Map<String, dynamic> jsonData = json.decode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpaper(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleName(
          firstTitle: 'Wallpaper',
          secondTitle: "Mix",
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Scrollbar(
                child: StaggeredGridView.countBuilder(
                    staggeredTileBuilder: (index) =>
                        StaggeredTile.count(2, index.isEven ? 2 : 1),
                    crossAxisCount: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    itemCount: wallpapers.length,
                    itemBuilder: (context, i) {
                      return WallpaperItem(
                        imgUrl: wallpapers[i].src.portrait,
                        nameAuthor: wallpapers[i].photographer,
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
