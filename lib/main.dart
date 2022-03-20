import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/theme/custom_theme.dart';

import 'bloc/app_cubit.dart';
import 'bloc/app_states.dart';
import 'bloc/bloc_observer.dart';
import 'core/network/remote/dio_helper.dart';
import 'features/layout/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.dioInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getBusiness()
        ..getSports()
        ..getScience()
        ..getHealth(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: AppCubit.get(context).themeMode
              ? ThemeMode.light
              : ThemeMode.dark,
          theme: CustomTheme.lightTheme(context),
          darkTheme: CustomTheme.darkTheme(context),
          home: NewsLayout(),
        ),
      ),
    );
  }
}
