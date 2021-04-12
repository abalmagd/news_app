import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/styles.dart';

Widget newsItemBuilder({
  @required BuildContext context,
  @required dynamic articles,
  Function onPressed,
}) =>
    Padding(
      padding: EdgeInsets.all(18),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.4,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(articles['urlToImage']),
                    /*NetworkImage(articles['urlToImage'] ??
                        'https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png')*/
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles['title'] ?? '',
                    maxLines: 2,
                    style: articleTitleStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(articles['source']['name'] ?? '', style: articlePublisherStyle),
                  SizedBox(height: 20),
                  Text(
                    articles['description'] ?? '',
                    maxLines: 4,
                    style: articleDescriptionStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Text(articles['publishedAt'] ?? '', style: articleDateStyle),
                ],
              ),
            ),
            IconButton(icon: Icon(Icons.open_in_new), onPressed: onPressed)
          ],
        ),
      ),
    );
