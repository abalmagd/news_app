import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/layout/search_layout.dart';

import '../../bloc/app_cubit.dart';
import '../../bloc/app_states.dart';
import '../business_screen.dart';
import '../health_screen.dart';
import '../science_screen.dart';
import '../settings_screen.dart';
import '../sports_screen.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageViewController = PageController(initialPage: 0);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
            bottom: PreferredSize(
                child: Container(color: Colors.teal, height: 2.0),
                preferredSize: Size.fromHeight(2.0)),
            title: Text(AppCubit.get(context)
                .screenTitles[AppCubit.get(context).bottomNavIndex]),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SearchLayout()));
                    AppCubit.get(context).dbInit();
                    AppCubit.get(context).emit(SearchState());
                  }),
              IconButton(
                  icon: Icon(Icons.brightness_6_outlined),
                  onPressed: () => AppCubit.get(context).changeTheme()),
            ]),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 14,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.teal, width: 1.5))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.teal,
            showUnselectedLabels: true,
            // selectedLabelStyle: bottomNavTextStyle, // TODO
            currentIndex: AppCubit.get(context).bottomNavIndex,
            onTap: (index) => pageViewController.jumpToPage(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_basketball_outlined), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined), label: 'Science'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital_outlined), label: 'Health'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
        body: PageView(
          controller: pageViewController,
          onPageChanged: (index) => AppCubit.get(context).changeBottomNavIndex(index),
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
