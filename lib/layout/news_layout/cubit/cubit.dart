import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/health_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  String country = 'us';

  List screenList = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    PoliticsScreen(),
    SettingsScreen(),
  ];

  List screenTitles = [
    'Business',
    'Sports',
    'Science',
    'Health',
    'Settings',
  ];

  List<dynamic> news = [];

  void changeBottomNavIndex(int value) {
    bottomNavIndex = value;
    emit(BottomNavChangedState());
  }

  Future<void> getData(BuildContext context) async {
    emit(NewsLoadingState());
    await DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': NewsCubit.get(context).country,
        'category': NewsCubit.get(context)
            .screenTitles[NewsCubit.get(context).bottomNavIndex]
            .toString()
            .toLowerCase(),
        'apiKey': 'b6c21e0ba459417e8ff250cf6e350b37'
      },
    ).then((response) {
      news = response.data['articles'];
      emit(NewsLoadingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsLoadingErrorState());
    });
  }
}
