
import 'package:dentist/app/modules/home/repository/categories_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => CategoriesStore()),];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];

}