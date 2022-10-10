import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_login_screen/core/theme/cubit/theme_cubit.dart';
import 'package:responsive_login_screen/core/widgets/responsive_screen.dart';
import 'package:responsive_login_screen/module/login/presentation/widget/login_form.dart';
import 'package:responsive_login_screen/module/login/presentation/widget/promotion_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ResponsiveScreen(
            mobile: _MobileLayout(),
            tablet: _DekstopLayout(),
            dekstop: _DekstopLayout(),
          ),
          Positioned(
            left: 32,
            bottom: 32,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                shape: BoxShape.circle,
                border: ResponsiveScreen.isMobile(context)
                    ? Border.all(color: Colors.grey, width: 1)
                    : null,
              ),
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().changeThemeMode(
                            state.themeMode == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light,
                          );
                    },
                    icon: Icon(
                      state.themeMode == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const LoginForm(),
    );
  }
}

class _DekstopLayout extends StatelessWidget {
  const _DekstopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: PromotionImages()),
        Expanded(
          child: LoginForm(),
        ),
      ],
    );
  }
}
