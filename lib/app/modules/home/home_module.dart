import 'package:dentist/app/modules/home/pages/products/details_page.dart';
import 'package:dentist/app/modules/home/repository/products_store.dart';
import 'package:dentist/app/modules/home/pages/products/list_page.dart';
import 'package:dentist/app/modules/home/repository/categories_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductsStore()),
    Bind.lazySingleton((i) => CategoriesStore()),
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('/products/', child: (_, args) => ListPage(category: args.data,)),
    ChildRoute('/details/',
        child: (_, args) => DetailsPage(product: args.data)),
  ];
}
