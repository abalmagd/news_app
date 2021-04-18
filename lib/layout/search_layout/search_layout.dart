import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';

class SearchLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Expanded(
                    child: TextField(),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.brightness_6_outlined),
                      onPressed: () {},
                    ),
                  ]),
              body: ListView.separated(
                itemBuilder: (context, index) => Container(),
                separatorBuilder: (context, index) => Container(),
                itemCount: 10,
              ),
            ));
  }
}
