import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app_module.dart';
import 'package:project/app_widget.dart';

void main() async {
  runApp(ModularApp(module: ProjectModule(), child: const ProjectApp()));
}
