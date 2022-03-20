import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/bottom_sheet_builder.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({
    Key key,
    this.articles,
    this.onPressed,
  }) : super(key: key);

  final dynamic articles;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: articles.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => Padding(
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
                              image: CachedNetworkImageProvider(articles[index]['urlToImage'] ??
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
                              articles[index]['title'] ?? '',
                              maxLines: 2,
                              // style: articleTitleStyle, todo
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(articles[index]['source']['name'] ?? '',
                                /*style: articlePublisherStyle todo*/),
                            SizedBox(height: 20),
                            Text(
                              articles[index]['description'] ?? '',
                              maxLines: 4,
                              /*style: articleDescriptionStyle, todo*/
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Text(articles[index]['publishedAt'] ?? '', /*style: articleDateStyle todo*/),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.open_in_new),
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => BottomSheetBuilder(articles: articles)),
                      )
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          itemCount: articles.length),
      fallback: (context) => Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
