import 'package:flutter/material.dart';
import 'package:linocinema/ui/screens/movies/movie_details_screen.dart';
import 'package:page_transition/page_transition.dart';

Widget searchMoviesCard(BuildContext context, movies) {
  final int permission = movies['permission'];
  final Map user = movies['user'];
  final String image = movies['image'];
  final String imageLink = movies['image_link'];
  final String title = movies['title'];
  final String trailer = movies['trailer'];
  final String genre = movies['genre'];
  final int year = movies['year'];
  final String link = movies['link'];
  final int mb = movies['mb'];
  final String subtitle = movies['subtitle'];
  final String description = movies['description'];

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
                  'MOVIE',
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
              child: MovieDetail(
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
                  'MOVIE',
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
