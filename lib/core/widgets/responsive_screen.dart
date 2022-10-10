import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.dekstop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget dekstop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
  static bool isTable(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isDekstop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth >= 1200) {
          return dekstop;
        } else if (constrains.maxWidth >= 800 && constrains.maxWidth < 1200) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
