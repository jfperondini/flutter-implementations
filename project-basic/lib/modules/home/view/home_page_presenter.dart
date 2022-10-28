import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/config/responsive_widget.dart';
import 'package:project/modules/home/controller/collections_controller.dart';
import 'package:project/modules/home/view/home_page_mobile.dart';

class HomePagePresenter extends StatefulWidget {
  const HomePagePresenter({super.key});

  @override
  State<HomePagePresenter> createState() => _HomePagePresenterState();
}

class _HomePagePresenterState extends State<HomePagePresenter> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: homeController,
      builder: (context, child) {
        return ResponsiveWidget(
          buildMobile: (context) => const HomePageMobile(),
          buildTablet: (context) => const HomePageMobile(),
          buildDesktop: (context) => const HomePageMobile(),
        );
      },
    );
  }
}
