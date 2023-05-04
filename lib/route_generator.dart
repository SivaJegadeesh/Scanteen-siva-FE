import 'package:animated_login/pages/auth_page.dart';
import 'package:animated_login/shared/widgets/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:animated_login/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/authpage':
        return MaterialPageRoute(builder: (_) => AuthPage());
      case '/usersignup':
        return MaterialPageRoute(builder: (_) => UserSignUp());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body:Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}