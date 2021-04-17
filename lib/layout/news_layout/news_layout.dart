import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/styles.dart';

//TODO: ADD PAGE VIEW
class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    TextEditingController searchController = TextEditingController();
    final pageViewController = PageController(initialPage: 0);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(
              title: ConditionalBuilder(
                condition: isSearching,
                builder: (context) => TextFormField(
                  onFieldSubmitted: (value) =>
                      NewsCubit.get(context).getSearch(value),
                  controller: searchController,
                  maxLength: 30,
                ),
                fallback: (context) => Text(NewsCubit.get(context)
                    .screenTitles[NewsCubit.get(context).bottomNavIndex]),
              ),
              actions: [
                IconButton(
                  icon: Icon(NewsCubit.get(context).search),
                  onPressed: () {
                    if (isSearching) {
                      NewsCubit.get(context).changeSearchIcon(Icons.search);
                      isSearching = false;
                    } else {
                      NewsCubit.get(context).changeSearchIcon(Icons.close);
                      isSearching = true;
                    }
                  },
                ),
                IconButton(
                    icon: Icon(Icons.brightness_6_outlined), onPressed: () {}),
              ]),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height / 14,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: primarySw, width: 1.5))),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: primarySw,
              showUnselectedLabels: true,
              selectedLabelStyle: bottomNavTextStyle,
              currentIndex: NewsCubit.get(context).bottomNavIndex,
              onTap: (index) {
                NewsCubit.get(context).changeBottomNavIndex(index);
                pageViewController.jumpToPage(index);
                /*pageViewController.animateToPage(
                  index,
                  duration: Duration(seconds: 1),
                  curve: Curves.ease,
                );*/
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_basketball_outlined),
                    label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science_outlined), label: 'Science'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_hospital_outlined), label: 'Health'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          ),
          body: ConditionalBuilder(
            condition: isSearching,
            builder: (context) => SearchScreen(),
            fallback: (context) => PageView(
              controller: pageViewController,
              onPageChanged: (index) {
                NewsCubit.get(context).changeBottomNavIndex(index);
              },
              children: [
                NewsCubit.get(context).screenList[0],
                NewsCubit.get(context).screenList[1],
                NewsCubit.get(context).screenList[2],
                NewsCubit.get(context).screenList[3],
                NewsCubit.get(context).screenList[4],
              ],
            ),
          )
          /*NewsCubit.get(context).screenList[NewsCubit.get(context).bottomNavIndex],*/
          ),
    );
  }
}
