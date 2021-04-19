import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/shared/styles.dart';

class SearchLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                  leadingWidth: 30,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextField(
                      onChanged: (text) {
                        if (text.isEmpty) {
                          isSearching = false;
                          NewsCubit.get(context).emit(SearchState());
                        } else {
                          isSearching = true;
                          // NewsCubit.get(context).getSearch(text);
                        }
                      },
                      onSubmitted: (text) => NewsCubit.get(context).getSearch(text),
                      controller: NewsCubit.get(context).searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.close, size: 17),
                            onPressed: () {
                              NewsCubit.get(context).searchController.clear();
                              isSearching = false;
                              NewsCubit.get(context).emit(SearchState());
                            }),
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.brightness_6_outlined),
                      onPressed: () {},
                    )
                  ]),
              body: ConditionalBuilder(
                condition: isSearching,
                builder: (context) => SearchScreen(),
                fallback: (context) => Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Search History', style: searchHistoryStyle),
                      Divider(thickness: 1, color: Colors.teal),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => historyBuilder(
                            textOnPressed: () {},
                            buttonOnPressed: () {},
                          ),
                          separatorBuilder: (context, index) =>
                              Divider(thickness: 0.2, color: Colors.teal),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
