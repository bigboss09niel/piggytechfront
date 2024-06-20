import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Colors.white60,
    appBar: AppBar(
      title: Text('User Profile'),
      backgroundColor: Colors.blue,
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Name',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            'Roniel D. Madrigal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'Year',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            'BSIT - Business Analytics - 3301',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 30.0,),
          Text(
            'Email',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70,
              letterSpacing: 2.0,
            ),
          ),
          Text(
            '21-16871@g.batstate-u.edu.ph',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    ),
  ),
));
