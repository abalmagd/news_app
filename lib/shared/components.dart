import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/shared/styles.dart';

import 'colors.dart';

Widget newsItemBuilder({
  @required BuildContext context,
  @required dynamic articles,
  Function() onPressed,
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
                    image: CachedNetworkImageProvider(articles['urlToImage'] ??
                        'https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png'),
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
            IconButton(
              icon: Icon(Icons.open_in_new),
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => bottomSheetBuilder(context, articles)),
            )
          ],
        ),
      ),
    );

Widget bottomSheetBuilder(BuildContext context, dynamic articles) => Padding(
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
            style: articleTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Text('Publisher: ' + articles['source']['name'] ?? '',
              style: articlePublisherStyle),
          SizedBox(height: 20),
          Text(
            articles['description'] ?? '',
            style: articleDescriptionStyle,
          ),
          SizedBox(height: 20),
          Text(
            articles['content'] ?? '',
            style: articleDescriptionStyle,
          ),
        ],
      ),
    );

Widget newsBuilder({@required List list}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              newsItemBuilder(context: context, articles: list[index]),
          separatorBuilder: (context, index) => Divider(
                color: primarySw,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
          itemCount: list.length),
      fallback: (context) => Center(child: CircularProgressIndicator.adaptive()),
    );

Widget historyBuilder({
  @required Function() textOnPressed,
  @required Function() buttonOnPressed,
  @required int index,
  @required BuildContext context,
}) =>
    Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              child: InkWell(
                onTap: textOnPressed,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    NewsCubit.get(context).searchHistory[index]['query'].toString(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: buttonOnPressed,
            splashRadius: 20,
          ),
        ],
      ),
    );
