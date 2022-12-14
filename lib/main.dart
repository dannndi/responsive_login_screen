import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_login_screen/core/theme/cubit/theme_cubit.dart';
import 'package:responsive_login_screen/main_module.dart';

import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';
import 'core/theme/app_theme.dart';

void main() {
  MainModule.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        )
      ],
      child: Builder(builder: (context) {
        final themeMode = context.watch<ThemeCubit>().state.themeMode;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Responsive Login",
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          initialRoute: AppRouteName.login,
          onGenerateRoute: AppRoute.generate,
          builder: (context, child) {
            return ResponsiveWrapper.builder(
              child,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            );
          },
        );
      }),
    );
  }
}
