import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_cubit.dart';
import '../bloc/app_states.dart';
import '../widgets/news_builder.dart';

class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) => RefreshIndicator(
              onRefresh: () async => AppCubit.get(context).getHealth(),
              child: NewsBuilder(
                articles: AppCubit.get(context).healthNews,
              ),
            ));
  }
}
