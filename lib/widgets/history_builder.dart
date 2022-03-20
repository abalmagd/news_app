import 'package:flutter/material.dart';

import '../bloc/app_cubit.dart';

class HistoryBuilder extends StatelessWidget {
  const HistoryBuilder({
    Key key,
    this.textOnPressed,
    this.buttonOnPressed,
    this.index,
  }) : super(key: key);

  final Function() textOnPressed;
  final Function() buttonOnPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              child: InkWell(
                onTap: textOnPressed,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppCubit.get(context)
                        .searchHistory[index]['query']
                        .toString(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: buttonOnPressed,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}
