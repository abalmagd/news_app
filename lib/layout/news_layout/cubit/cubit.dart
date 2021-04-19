import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int bottomNavIndex = 0;

  String country = 'us';

  TextEditingController searchController = TextEditingController();

  List<String> countries = [
    'Egypt',
    'USA',
    'UAE',
    'France',
    'Japan',
    'Saudi Arabia',
  ];

  Map<String, String> countryCodes = {
    'Egypt': 'eg',
    'USA': 'us',
    'UAE': 'ae',
    'France': 'fr',
    'Japan': 'jp',
    'Saudi Arabia': 'sa'
  };

  List screenTitles = [
    'Business',
    'Sports',
    'Science',
    'Health',
    'Settings',
  ];

  List<dynamic> businessNews;
  List<dynamic> sportsNews;
  List<dynamic> scienceNews;
  List<dynamic> healthNews;
  List<dynamic> searchNews;

  bool checkSearchStatus() {
    emit(SearchState());
    return searchController.text.isEmpty;
  }

  void changeBottomNavIndex(int value) {
    bottomNavIndex = value;
    emit(BottomNavChangedState());
  }

  void changeCountry(String value) {
    country = value;
    print('country from cubit: $country');
    getBusiness();
    getHealth();
    getSports();
    getScience();
    emit(CountryChangedState());
  }

  void getSearch(String searchQuery) {
    emit(SearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$searchQuery',
        'apiKey': 'b6c21e0ba459417e8ff250cf6e350b37'
      },
    ).then((response) {
      searchNews = response.data['articles'];
      emit(SearchLoadingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchLoadingErrorState());
    });
  }

  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category': 'business',
        'apiKey': 'b6c21e0ba459417e8ff250cf6e350b37'
      },
    ).then((response) {
      businessNews = response.data['articles'];
      emit(BusinessLoadingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(BusinessLoadingErrorState());
    });
  }

  void getSports() {
    emit(SportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category': 'sports',
        'apiKey': 'b6c21e0ba459417e8ff250cf6e350b37'
      },
    ).then((response) {
      sportsNews = response.data['articles'];
      emit(SportsLoadingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SportsLoadingErrorState());
    });
  }

  void getScience() {
    emit(ScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category': 'science',
        'apiKey': 'b6c21e0ba459417e8ff250cf6e350b37'
      },
    ).then((response) {
      scienceNews = response.data['articles'];
      emit(ScienceLoadingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ScienceLoadingErrorState());
    });
  }

  void getHealth() {
    emit(HealthLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category': 'health',
        'apiKey': 'b6c21e0ba459417e8ff250cf6e350b37'
      },
    ).then((response) {
      healthNews = response.data['articles'];
      emit(HealthLoadingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HealthLoadingErrorState());
    });
  }
}
