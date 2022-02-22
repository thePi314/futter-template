import 'package:flutter/material.dart';

import './screens/login/login-screen.dart';
import './screens/forgot-password/forgot-password-screen.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => const LoginScreen(),
  "/forgot-password": (BuildContext context) => const ForgotPasswordScreen(),
};