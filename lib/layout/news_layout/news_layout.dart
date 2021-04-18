import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/layout/search_layout/search_layout.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/health_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/styles.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    final pageViewController = PageController(initialPage: 0);

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is SearchState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchLayout()));
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
            title: Text(NewsCubit.get(context).screenTitles[NewsCubit.get(context).bottomNavIndex]),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  isSearching = true;
                  NewsCubit.get(context).startSearch();
                },
              ),
              IconButton(icon: Icon(Icons.brightness_6_outlined), onPressed: () {}),
            ]),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 14,
          decoration: BoxDecoration(border: Border(top: BorderSide(color: primarySw, width: 1.5))),
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
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
              BottomNavigationBarItem(icon: Icon(Icons.sports_basketball_outlined), label: 'Sports'),
              BottomNavigationBarItem(icon: Icon(Icons.science_outlined), label: 'Science'),
              BottomNavigationBarItem(icon: Icon(Icons.local_hospital_outlined), label: 'Health'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
        body: PageView(
          controller: pageViewController,
          onPageChanged: (index) => NewsCubit.get(context).changeBottomNavIndex(index),
          children: [
            BusinessScreen(),
            SportsScreen(),
            ScienceScreen(),
            HealthScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
