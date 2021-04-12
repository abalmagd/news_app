import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Container(
          height: MediaQuery.of(context).size.height / 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.4,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/250?image=9'), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('title'),
                    Text('publisher'),
                    Text('description'),
                    Spacer(),
                    Text('date'),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
