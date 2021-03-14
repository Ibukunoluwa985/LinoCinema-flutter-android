import 'package:flutter/material.dart';
import 'package:linocinema/ui/screens/tvshows/tvshow_details_screen.dart';
import 'package:page_transition/page_transition.dart';

Widget searchTvshowsCard(BuildContext context, tvshows) {
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

  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 700),
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
    child: Card(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TITLE: $title',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text(
                  'YEAR: $year',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 2.5,
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2.5,
                ),
                Text(
                  'TVSHOW',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 2.5,
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2.5,
                ),
                Icon(
                  Icons.tv,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
