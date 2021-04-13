import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles.dart';

import 'layout/news_layout/cubit/cubit.dart';
import 'layout/news_layout/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.dioInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..getSports()
        ..getHealth()
        ..getScience(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: primarySw,
          appBarTheme: AppBarTheme(
            titleSpacing: 18,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            titleTextStyle: appBarTextStyle,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: NewsLayout(),
      ),
    );
  }
}