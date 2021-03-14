import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:linocinema/ui/screens/explores/explore_details_screen.dart';
import 'package:page_transition/page_transition.dart';

Widget exploreCard(BuildContext context, explore) {
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

  if (permission == 0)
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      child: Card(
        child: GridTile(
          child: CachedNetworkImage(
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
                  )),
          header: Container(
            color: Colors.red.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'This movie has been disable',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
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
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    '$year',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
              duration: Duration(milliseconds: 250),
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
                  Text(
                    '$mb MB',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.right,
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
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    '$year',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
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
