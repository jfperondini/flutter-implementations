import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:shared/app_widget.dart';
import 'package:shared/app_module.dart';

void main() async {
  runApp(ModularApp(module: SuporteModule(), child: const SuporteApp()));
}
