import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/modules/home/view/home_page_presenter.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomePagePresenter()),
      ];
}
