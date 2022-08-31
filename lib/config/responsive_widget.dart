import 'package:flutter/material.dart';
import 'package:my_api/config/size_config.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget(this.mobile, this.tablet, this.desktop, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);

    if (sizeConfig.isDesktop) {
      return desktop;
    } else if (sizeConfig.isTablet) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
