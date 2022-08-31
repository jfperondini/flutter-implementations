import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:my_api/app_widget.dart';
import 'package:my_api/modules/menu/app_module.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}
