import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({
    Key key,
    this.articles,
  }) : super(key: key);

  final dynamic articles;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(kMediumSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSmallSpacing),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      articles['urlToImage'] ?? altImage),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: kSmallSpacing),
          Text(
            articles['title'] ?? 'Article',
            maxLines: 2,
            // style: articleTitleStyle, todo
          ),
          SizedBox(height: kSmallSpacing),
          Text(
            'Publisher: ' + articles['source']['name'] ??
                '', /*style: articlePublisherStyle todo*/
          ),
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
