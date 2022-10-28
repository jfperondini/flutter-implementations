import 'package:project/api/client_interface.dart';
import 'package:project/modules/home/models/home_model.dart';

abstract class HomeService {
  final IHttpClient home;

  HomeService(this.home);

  Future<List<HomeModel>> getList();
}

class HomeServiceMock implements HomeService {
  @override
  final IHttpClient home;

  HomeServiceMock(this.home);

  @override
  Future<List<HomeModel>> getList() {
    throw UnimplementedError();
  }
}
