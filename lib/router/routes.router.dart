import 'package:flutter/material.dart';
import 'package:test_aspirante_flutter/ui/views/home/home.view.dart';
import 'package:test_aspirante_flutter/ui/views/login.view.dart';
import 'package:test_aspirante_flutter/ui/views/splash_screen.view.dart';
import 'package:test_aspirante_flutter/ui/views/movie_details.view.dart';

class RoutesRouter {
  static const String LOGIN_VIEW = '/LoginView';
  static const String SPLASH_SCREEN = '/SplashScreen';
  static const String HOME_VIEW = '/HomeView';
  static const String MOVIES_DETAILS = '/MovieDetailsView';


  static  Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      LOGIN_VIEW: (BuildContext context) => LoginView(),
      SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
      HOME_VIEW : (BuildContext context) => HomeView(),
      MOVIES_DETAILS: (BuildContext context) => MovieDetailsView(),
    };
  }
}