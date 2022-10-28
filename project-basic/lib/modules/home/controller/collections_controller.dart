import 'package:flutter/material.dart';
import 'package:project/modules/home/service/collections_service.dart';

class HomeController with ChangeNotifier {
  final HomeService _service;

  HomeController(this._service);
}
