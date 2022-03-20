import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app_cubit.dart';
import '../../bloc/app_states.dart';
import '../../widgets/history_builder.dart';
import '../search_screen.dart';

class SearchLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                  leadingWidth: 30,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                      AppCubit.get(context).database.close();
                      AppCubit.get(context).searchController.clear();
                    },
                  ),
                  title: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextField(
                      onChanged: (text) {
                        if (text.isEmpty) {
                          AppCubit.get(context).searchNews.clear();
                          AppCubit.get(context).isSearching = false;
                          AppCubit.get(context).emit(SearchState());
                        } else {
                          AppCubit.get(context).isSearching = true;
                        }
                      },
                      onSubmitted: (text) {
                        if (AppCubit.get(context).searchNews.isNotEmpty) {
                          AppCubit.get(context).searchNews.clear();
                        }
                        AppCubit.get(context).isSearching = true;
                        AppCubit.get(context).getSearch(text);
                        AppCubit.get(context).dbInsert(text);
                      },
                      controller: AppCubit.get(context).searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.close, size: 17),
                            onPressed: () {
                              AppCubit.get(context).searchController.clear();
                              AppCubit.get(context).isSearching = false;
                              AppCubit.get(context).searchNews.clear();
                              AppCubit.get(context).emit(SearchState());
                            }),
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.brightness_6_outlined),
                      onPressed: () => AppCubit.get(context).changeTheme(),
                    )
                  ]),
              body: ConditionalBuilder(
                condition: AppCubit.get(context).isSearching,
                builder: (context) => SearchScreen(),
                fallback: (context) => Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Search History', /*style: searchHistoryStyle*/ /*TODO*/),
                      Divider(thickness: 1, color: Colors.teal),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => HistoryBuilder(
                            textOnPressed: () {
                              AppCubit.get(context).searchController.text =
                                  AppCubit.get(context)
                                      .searchHistory[index]['query']
                                      .toString();
                              AppCubit.get(context).getSearch(AppCubit.get(context)
                                  .searchHistory[index]['query']
                                  .toString());
                              AppCubit.get(context).isSearching = true;
                            },
                            buttonOnPressed: () {
                              AppCubit.get(context).dbDelete(
                                  (AppCubit.get(context).searchHistory[index]['id']));
                            },
                            index: index,
                          ),
                          separatorBuilder: (context, index) =>
                              Divider(thickness: 0.2, color: Colors.teal),
                          itemCount: AppCubit.get(context).searchHistory.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
