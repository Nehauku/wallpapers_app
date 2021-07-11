import 'package:anime_wallpapers_app/screen/view_screen.dart';
import 'package:flutter/material.dart';
import 'animated_dialog.dart';
import 'package:transparent_image/transparent_image.dart';

class WallpaperItem extends StatelessWidget {
  final String imgUrl;
  final String nameAuthor;
  WallpaperItem({this.imgUrl, this.nameAuthor});
  @override
  Widget build(BuildContext context) {
    OverlayEntry popupDialog;
    return GestureDetector(
      onLongPress: () {
        popupDialog = OverlayEntry(builder: (context) {
          return AnimatedDialog(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.face_rounded),
                            radius: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            nameAuthor,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      imgUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
        Overlay.of(context).insert(popupDialog);
      },
      onLongPressEnd: (details) {
        popupDialog?.remove();
      },
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ViewScreen(imgUrl)));
      },
      child: Hero(
        tag: imgUrl,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: EdgeInsets.zero,
            child: Container(
              // margin: EdgeInsets.all(8),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imgUrl,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
