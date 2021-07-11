import 'package:anime_wallpapers_app/screen/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryItem extends StatelessWidget {
  final String imgUrl;
  final String catName;

  CategoryItem({@required this.catName, @required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoriesScreen(catName.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            ClipRRect(
              child: FadeInImage.memoryNetwork(
                image: imgUrl,
                placeholder: kTransparentImage,
                width: 100,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            Container(
              child: Text(
                catName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              alignment: Alignment.center,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
