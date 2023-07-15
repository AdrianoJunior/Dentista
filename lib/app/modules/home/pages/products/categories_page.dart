import 'package:dentist/app/modules/home/repository/categories_store.dart';
import 'package:dentist/app/utils/jsonRead.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';


class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _store = CategoriesStore();

  List<String>? categories = [];

  // Carrega as categorias a partir de um arquivo json
  // nos assets do aplicativo

  Future<List<String>?> loadCategories() async {
    // Load the JSON file
    final jsonMap = await readJsonFile('assets/json/categories.json');

    categories =
        jsonMap != null ? List<String>.from(jsonMap['categories']) : [];

    return categories;
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F9FA),
        title: const Text('Categorias', style: TextStyle(color: Colors.black),),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Observer(
          builder: (context) {
            if(_store.categories!.isEmpty) {
              _store.loadCategories();
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: _store.categories?.length ?? 0,
                itemBuilder: (context, idx) => Column(
                  children: [
                    ListTile(
                      onTap: () {
                        // Abre a tela de lista de produtos, exibindo apenas os produtos
                        // da categoria selecionada (não interfere no funcionamento da pesquisa)
                        Modular.to.pushNamed('/products/', arguments: _store.categories?[idx]);
                      },
                      title: Text(
                        _store.categories?[idx] ?? 'Categoria',
                        style: const TextStyle(color: Color(0xff00B4CC)),
                      ),
                    ),
                    const Divider(
                      color: Color(0xffEBF1F4),
                      thickness: 2,
                    ),
                  ],
                ),
              );
            }
          }
      ),
    );
  }
}
