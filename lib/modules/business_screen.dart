import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getData(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) => ConditionalBuilder(
        condition: NewsCubit.get(context).news.length > 0,
        builder: (context) => RefreshIndicator(
          onRefresh: () => NewsCubit.get(context).getData(context),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  newsItemBuilder(context: context, articles: NewsCubit.get(context).news[index]),
              separatorBuilder: (context, index) => Divider(
                    color: primarySw,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
              itemCount: NewsCubit.get(context).news.length),
        ),
        fallback: (context) => Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
