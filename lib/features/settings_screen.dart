import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../bloc/app_cubit.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://cdn.fastly.picmonkey.com/contentful/'
                    'h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/'
                    '1-intro-photo-final.jpg?w=800&q=70'),
                radius: 40,
              ),
              SizedBox(width: 15),
              Text('Mahmoud Abulmagd', /*style: userNameStyle TODO*/),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.teal, thickness: 1),
          SizedBox(height: 20),
          ListTile(
              title: Text('Pick news country', /*style: changeCountryStyle TODO*/),
              trailing: DropdownButton<String>(
                  // AppCubit.get(context).countryCodes[NewsCubit.get(context).country]
                  value: AppCubit.get(context).countryCodes.keys.firstWhere(
                      (k) =>
                          AppCubit.get(context).countryCodes[k] ==
                          AppCubit.get(context).country,
                      orElse: () => null),
                  onChanged: (item) {
                    AppCubit.get(context).changeCountry(
                        AppCubit.get(context).countryCodes[item]);
                  },
                  items: AppCubit.get(context).countryCodes.keys.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList())),
        ],
      ),
    );
  }
}
