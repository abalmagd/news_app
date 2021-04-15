import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:news_app/layout/news_layout/cubit/cubit.dart';
import 'package:news_app/shared/colors.dart';
import 'package:news_app/shared/styles.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider('https://cdn.fastly.picmonkey.com/contentful/'
                    'h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/'
                    '1-intro-photo-final.jpg?w=800&q=70'),
                radius: 40,
              ),
              SizedBox(width: 15),
              Text('Mahmoud Abulmagd', style: userNameStyle),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: primarySw, thickness: 1),
          SizedBox(height: 20),
          ListTile(
              title: Text('Pick news country', style: changeCountryStyle),
              trailing: DropDown(
                hint: Text('Country'),
                items: NewsCubit.get(context).countries,
                initialValue: NewsCubit.get(context)
                    .countryCodes[NewsCubit.get(context).country],
                onChanged: (item) {
                  NewsCubit.get(context)
                      .changeCountry(NewsCubit.get(context).countryCodes[item]);
                },
              )),

          // Old DropDownButton
          /*DropdownButton<String>(
                  value: NewsCubit.get(context).countryCodes[NewsCubit.get(context).country],
                  hint: Text('Country'),
                  onChanged: (item) {
                    NewsCubit.get(context).changeCountry(NewsCubit.get(context).countryCodes[item]);
                  },
                  items: NewsCubit.get(context).countries.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()))*/
        ],
      ),
    );
  }
}
