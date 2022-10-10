import 'package:flutter/material.dart';
import 'package:responsive_login_screen/module/login/presentation/login_screen.dart';

import '/core/route/app_route_name.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
    }

    return null;
  }
}
