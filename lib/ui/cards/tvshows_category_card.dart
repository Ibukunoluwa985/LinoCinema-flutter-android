import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linocinema/ui/screens/tvshows/tvshow_details_screen.dart';
import 'package:page_transition/page_transition.dart';

Widget tvshowsCategoryCard(BuildContext context, tvshows) {
  final int id = tvshows['id'];
  final Map user = tvshows['user'];
  final String image = tvshows['image'];
  final String imageLink = tvshows['image_link'];
  final String title = tvshows['title'];
  final String trailer = tvshows['trailer'];
  final String genre = tvshows['genre'];
  final int year = tvshows['year'];
  final String language = tvshows['language'];
  final String description = tvshows['description'];

  imageList() {
    if (imageLink != 'None') {
      return CachedNetworkImage(
          memCacheWidth: 200,
          memCacheHeight: 360,
          imageUrl: imageLink,
          placeholder: (context, url) =>
              Image.asset('assets/images/placeholder.png'),
          errorWidget: (context, url, error) => Column(
                children: [
                  Icon(Icons.error),
                  Text(
                    'error occured',
                    style: TextStyle(fontSize: 8.0),
                  )
                ],
              ));
    } else {
      return CachedNetworkImage(
          memCacheWidth: 200,
          memCacheHeight: 360,
          imageUrl: "https://www.linocinema.com$image",
          placeholder: (context, url) =>
              Image.asset('assets/images/placeholder.png'),
          errorWidget: (context, url, error) => Column(
                children: [
                  Icon(Icons.error),
                  Text(
                    'error occured',
                    style: TextStyle(fontSize: 8.0),
                  )
                ],
              ));
    }
  }

  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 250),
              type: PageTransitionType.fade,
              child: TvshowDetail(
                id: id,
                user: user,
                image: image,
                imageLink: imageLink,
                title: title,
                trailer: trailer,
                genre: genre,
                year: year,
                language: language,
                description: description,
              )));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      child: Card(
        child: GridTile(
          child: imageList(),
          header: Container(
            color: Colors.red.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.tv,
                  ),
                ],
              ),
            ),
          ),
          footer: Container(
            color: Colors.black.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    '$year',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
