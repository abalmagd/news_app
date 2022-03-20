import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../core/network/remote/dio_helper.dart';
import 'app_states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(NewsInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Database database;
  bool isSearching = false;
  String groupApiKey = '65f7f556ec76449fa7dc7c0069f040ca';
  String myApiKey = 'b6c21e0ba459417e8ff250cf6e350b37';
  int bottomNavIndex = 0;

  // false = white
  // true = dark
  bool themeMode = false;

  TextEditingController searchController = TextEditingController();

  String country = 'us';

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

  List<dynamic> businessNews = [];
  List<dynamic> sportsNews = [];
  List<dynamic> scienceNews = [];
  List<dynamic> healthNews = [];
  List<dynamic> searchNews = [];
  List<Map> searchHistory = [];

  void changeTheme() {
    themeMode ? themeMode = false : themeMode = true;
    emit(NewsThemeChangedState());
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

  void dbInit() async {
    await openDatabase(
      'news.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db
            .execute('CREATE TABLE Search (id INTEGER PRIMARY KEY, query TEXT)')
            .then((value) => print('db created'))
            .catchError((error) => print(error));
      },
      onOpen: (db) async {
        print('db opened');
        dbGet(db);
      },
    ).then((value) {
      database = value;
      emit(NewsInitDatabaseSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsInitDatabaseErrorState());
    });
  }

  void dbGet(Database db) async {
    await db.rawQuery('SELECT * FROM Search').then((value) {
      searchHistory = value;
      emit(NewsGetDatabaseSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsGetDatabaseErrorState());
    });
  }

  void dbInsert(String searchQuery) async {
    bool repeated = false;
    searchHistory.forEach((element) {
      if (element['query'] == searchQuery) repeated = true;
    });
    if (!repeated) {
      await database.transaction((txn) async {
        await txn.rawInsert('INSERT INTO Search(query) VALUES(?)', [searchQuery]);
      }).then((value) async {
        dbGet(database);
        emit(NewsInsertDatabaseSuccessState());
      }).catchError((error) {
        print(error);
        emit(NewsInsertDatabaseErrorState());
      });
    }
  }

  void dbDelete(int id) async {
    await database.rawDelete('DELETE FROM Search WHERE id = ?', [id]).then((value) async {
      dbGet(database);
      emit(NewsDeleteDatabaseSuccessState());
    }).catchError((error) {
      emit(NewsDeleteDatabaseErrorState());
    });
  }

  void changeBottomNavIndex(int value) {
    bottomNavIndex = value;
    emit(BottomNavChangedState());
  }

  void getSearch(String searchQuery) {
    emit(SearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {'q': '$searchQuery', 'apiKey': groupApiKey},
    ).then((response) {
      searchNews = response.data['articles'];
      emit(SearchLoadingSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchLoadingErrorState());
    });
  }

  Future<void> getBusiness() async {
    emit(BusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': country,
        'category': 'business',
        'apiKey': groupApiKey,
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
        'apiKey': groupApiKey,
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
        'apiKey': groupApiKey,
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
        'apiKey': groupApiKey,
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
