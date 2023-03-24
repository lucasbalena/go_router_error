// ignore_for_file: constant_identifier_names, file_names

import 'dart:async';

import 'package:flutter/material.dart';

const LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
const ONBOARD_KEY = "GD2G82CG9G82VDFGVD22DVG";

class AppService with ChangeNotifier {
  //late final SharedPreferences sharedPreferences;
  final StreamController<bool> _loginStateChange = StreamController<bool>();
  bool _loginState = false;
  bool _initialized = false;
  bool _onboarding = false;

  AppService();

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  bool get onBoarding => _onboarding;
  Stream<bool> get loginStateChange => _loginStateChange.stream;

  set loginState(bool state) {
    //  sharedPreferences.setBool(LOGIN_KEY, state);
    _loginState = state;
    _loginStateChange.add(state);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onBoarding(bool value) {
    //  sharedPreferences.setBool(ONBOARD_KEY, value);
    _onboarding = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    //_onboarding = sharedPreferences.getBool(ONBOARD_KEY) ?? false;
    _loginState = false;
    // This is just to demonstrate the splash screen is working.
    // In real-life applications, it is not recommended to interrupt the user experience by doing such things.
    // await Future.delayed(const Duration(seconds: 2));

    _initialized = true;
    notifyListeners();
  }
}
