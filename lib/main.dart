import 'package:flutter/material.dart';
import 'package:piggytechfront/home.dart';
import 'package:piggytechfront/pages/dashboard.dart';
import 'package:piggytechfront/pages/menu.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) =>Home(),
  },
));
