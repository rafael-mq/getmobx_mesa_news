import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmobx_mesa_news/pages/login_page.dart';
import 'package:getmobx_mesa_news/pages/news_page.dart';
import 'package:getmobx_mesa_news/pages/register_page.dart';

var mainApp = GetMaterialApp(
  initialRoute: '/',
  getPages: [
    GetPage(name: '/', page: () => LoginPage()),
    GetPage(name: '/register', page: () => RegisterPage()),
    GetPage(name: '/news', page: () => NewsPage()),
  ],
  theme: ThemeData(
    primaryColor: const Color(0xff010a53),
    accentColor: const Color(0xFF0075FF),
  ),
);
