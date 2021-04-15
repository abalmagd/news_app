import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/layout/news_layout/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).scienceNews ?? NewsCubit.get(context).getScience();
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) => RefreshIndicator(
              onRefresh: () async => NewsCubit.get(context).getScience(),
              child: newsBuilder(
                list: NewsCubit.get(context).scienceNews,
              ),
            ));
  }
}
