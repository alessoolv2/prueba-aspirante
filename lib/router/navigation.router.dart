import 'package:flutter/material.dart';

class NavigatorRouter {
  factory NavigatorRouter() {
    return _instance;
  }

  NavigatorRouter._internal(){
    initNavigate();
  }

  Future<dynamic> navigateTo(String routeName) {
    return _navigatorKey.currentState.pushNamed(routeName);
  }
  void goBack() {
    _navigatorKey.currentState.pop();
  }

  void popAll() {
    _navigatorKey.currentState.popUntil((route) => route.isFirst);
  }

  void goPage(String newRouteName) {
    _navigatorKey.currentState.pushNamedAndRemoveUntil(newRouteName, (_) => false);
  }

  void goPageWithArguments(String newRouteName, String args) {
    _navigatorKey.currentState.pushNamedAndRemoveUntil(newRouteName, (_) => false, arguments: args);
  }

  GlobalKey<NavigatorState> _navigatorKey;

  void initNavigate() {
    _navigatorKey = GlobalKey<NavigatorState>();
  }
  GlobalKey<NavigatorState> get navigator {
    return _navigatorKey;
  }

  static final NavigatorRouter _instance = NavigatorRouter._internal();
}