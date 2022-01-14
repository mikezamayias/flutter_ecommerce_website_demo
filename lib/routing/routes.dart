import 'package:flutter/material.dart';

import '../views/home/home_view.dart';
import '../views/login/login_view.dart';
import '../views/register/register_view.dart';

Map<String, Widget> routes = {
  'home': const HomeView(),
  'register': const RegisterView(),
  'login': const LoginView(),
};
