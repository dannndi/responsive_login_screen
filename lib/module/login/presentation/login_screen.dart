import 'package:flutter/material.dart';
import 'package:responsive_login_screen/core/widgets/responsive_screen.dart';
import 'package:responsive_login_screen/module/login/presentation/widget/login_form.dart';
import 'package:responsive_login_screen/module/login/presentation/widget/promotion_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveScreen(
        mobile: _MobileLayout(),
        tablet: _DekstopLayout(),
        dekstop: _DekstopLayout(),
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
