import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_login_screen/core/theme/app_color.dart';

class PromotionImages extends StatefulWidget {
  const PromotionImages({super.key});

  @override
  State<PromotionImages> createState() => _PromotionImagesState();
}

class _PromotionImagesState extends State<PromotionImages> {
  final titles = [
    "The best free stock photos, royalty free images & videos shared by creators.",
    "All the assets you need, in one place",
    "Free premium images Updated weekly",
    "Image Fonts for any project, big or small"
  ];

  final images = [
    "assets/illustration_1.jpg",
    "assets/illustration_2.jpg",
    "assets/illustration_3.jpg",
    "assets/illustration_4.jpg",
  ];

  final selectedIndex = ValueNotifier(0);
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        if (selectedIndex.value == images.length - 1) {
          selectedIndex.value = 0;
        } else {
          selectedIndex.value++;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primarySwatch[700]!,
            AppColor.primarySwatch,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, index, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Container(
                  key: UniqueKey(),
                  width: 320,
                  height: 280,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(
                        images[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: Wrap(
                  spacing: 8,
                  children: List.generate(images.length, (indexIndicator) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      height: 8,
                      width: indexIndicator == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: indexIndicator == index
                            ? AppColor.white
                            : AppColor.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    );
                  }),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Padding(
                  key: UniqueKey(),
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Text(
                    titles[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColor.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
