import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/styles.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
            title: Text(NewsCubit.get(context).screenTitles[NewsCubit.get(context).bottomNavIndex]),
            actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})]),
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
            onTap: (value) => NewsCubit.get(context).changeBottomNavIndex(value),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'Business', backgroundColor: Colors.red),
              BottomNavigationBarItem(icon: Icon(Icons.sports_basketball_outlined), label: 'Sports'),
              BottomNavigationBarItem(icon: Icon(Icons.science_outlined), label: 'Science'),
              BottomNavigationBarItem(icon: Icon(Icons.mail_outlined), label: 'Politics'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
        body: NewsCubit.get(context).screenList[NewsCubit.get(context).bottomNavIndex],
      ),
    );
  }
}
