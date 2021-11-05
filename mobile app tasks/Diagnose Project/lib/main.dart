import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/dashboard.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'Raleway'),
  initialRoute: '/home',
  routes: {
    '/loading': (context) => loading(),
    '/home': (context) => Home(),
    '/dashboard': (context) => dashboard(),
  }
));


