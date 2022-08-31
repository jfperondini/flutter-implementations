import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;
  SizeConfig(this.context);
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
  double get blockSizeHorizontal => screenWidth / 100;
  double get blockSizeVertical => screenHeight / 100;

  bool get isMobile => MediaQuery.of(context).size.width < 768;

  bool get isTablet =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 768;

  bool get isDesktop => MediaQuery.of(context).size.width >= 1200;
}
