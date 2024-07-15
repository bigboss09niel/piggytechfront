import 'package:flutter/material.dart';
import 'package:piggytechfront/pages/home.dart';
import 'package:piggytechfront/pages/dashboard.dart';
import 'package:piggytechfront/pages/menu.dart';
import 'package:piggytechfront/pages/signup.dart';
import 'package:piggytechfront/pages/login.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/login',
  routes: {
    '/dashboard' : (context) => Dashboard(),
    '/menu' : (context) => Menu(),
    '/profile' : (context) => Home(),
    '/signup' : (context) => Signup(),
    '/login' : (context) => Login(),
  },
));
