import 'package:flutter/widgets.dart';
import 'package:wuhan2020/pages/LoginPage.dart';
import 'package:wuhan2020/pages/WelcomePage.dart';

abstract class Routes{
  static Map<String, WidgetBuilder> routeMap = {
    "welcome_page" : (context) => WelcomePage(),
    "login_page" : (context) => LoginPage()
  };
}