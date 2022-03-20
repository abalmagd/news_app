import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({
    Key key,
    this.articles,
  }) : super(key: key);

  final dynamic articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(articles['urlToImage'] ??
                      'https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10),
          Text(
            articles['title'] ?? '',
            maxLines: 2,
            // style: articleTitleStyle, todo
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Text('Publisher: ' + articles['source']['name'] ?? '',
              /*style: articlePublisherStyle todo*/),
          SizedBox(height: 20),
          Text(
            articles['description'] ?? '',
            /*style: articleDescriptionStyle, todo*/
          ),
          SizedBox(height: 20),
          Text(
            articles['content'] ?? '',
            /*style: articleDescriptionStyle, todo*/
          ),
        ],
      ),
    );
  }
}
