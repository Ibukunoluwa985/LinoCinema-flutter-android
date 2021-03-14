import 'package:flutter/material.dart';
import 'package:linocinema/ui/screens/explores/explore_details_screen.dart';
import 'package:page_transition/page_transition.dart';

Widget searchExploresCard(BuildContext context, explore) {
  final int permission = explore['permission'];
  final Map user = explore['user'];
  final String image = explore['image'];
  final String imageLink = explore['image_link'];
  final String title = explore['title'];
  final String trailer = explore['trailer'];
  final String genre = explore['genre'];
  final int year = explore['year'];
  final String link = explore['link'];
  final int mb = explore['mb'];
  final String subtitle = explore['subtitle'];
  final String description = explore['description'];

  if (permission == 0)
    Card(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TITLE: This movie has been disable "$title"',
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
                  'Explore',
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
                  Icons.movie,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );

  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: ExploreDetail(
                user: user,
                image: image,
                imageLink: imageLink,
                link: link,
                title: title,
                trailer: trailer,
                genre: genre,
                year: year,
                mb: mb,
                subtitle: subtitle,
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
                  'Explore',
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
                  Icons.movie,
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
