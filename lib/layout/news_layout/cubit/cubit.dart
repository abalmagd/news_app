import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/politics_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;
  String country = 'egypt';

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
    'Politics',
    'Settings',
  ];

  void changeBottomNavIndex(int value) {
    bottomNavIndex = value;
    emit(BottomNavChangedState());
  }
}
