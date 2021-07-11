import 'package:anime_wallpapers_app/data/category_data.dart';
import 'package:anime_wallpapers_app/models/category_model.dart';
import 'package:anime_wallpapers_app/models/wallpaper_model.dart';
import 'package:anime_wallpapers_app/screen/search.dart';
import 'package:anime_wallpapers_app/widgets/category_item.dart';
import 'package:anime_wallpapers_app/widgets/title_name.dart';
import 'package:anime_wallpapers_app/widgets/wallpaper_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import '../data/category_data.dart';
import '../widgets/animated_dialog.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<WallpaperModel> wallpapers = [];
  TextEditingController searchController = TextEditingController();
  getTrendingWallpaper() async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=25'),
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
    getTrendingWallpaper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categoryData =
        Provider.of<CategoryData>(context, listen: false).getCategory;
    return Scaffold(
      appBar: AppBar(
        title: TitleName(
          firstTitle: 'Wallpaper',
          secondTitle: "Mix",
        ),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.only(left: 24, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'search wallpaper',
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Search(searchController.text)));
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  itemBuilder: (context, i) {
                    return CategoryItem(
                      imgUrl: categoryData[i].imgUrl,
                      catName: categoryData[i].catName,
                    );
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
