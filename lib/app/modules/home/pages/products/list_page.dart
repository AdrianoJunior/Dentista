import 'package:dentist/app/models/product.dart';
import 'package:dentist/app/modules/home/repository/products_store.dart';
import 'package:dentist/app/utils/prefs.dart';
import 'package:dentist/app/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_icons/line_icons.dart';

class ListPage extends StatefulWidget {
  final String? category;

  ListPage({super.key, this.category});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _store = ProductsStore();
  List<String> recentSearchList = [];

  String? get category => widget.category;

  // Recupera os itens da busca recente para serem utilziados no layout de pesquisa
  Future<List<String>> loadRecentSearches() async {
    final prefs = Prefs();
    List<String>? recentSearches = await prefs.getStringList('recentSearches');
    return recentSearches;
  }

  @override
  void initState() {
    super.initState();
    _store.loadProducts(category: category);

    loadRecentSearches().then((List<String> recentSearches) {
      recentSearchList = recentSearches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Action da AppBar para abrir o layout de pesquisa
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(recentSearchList: recentSearchList));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Observer(
        builder: (context) {
          // Mostra um Progress indicator na tela para indicar ao
          // usuário que está carregando as informações
          if (_store.isLoading) {
            return const Column(
              children: [
                Center(child: CircularProgressIndicator()),
                Text('Carregando...'),
              ],
            );
          } else {
            // Se não encontrar nenhum produto com a categoria selecionada
            // informa ao usuário que não existem produtos naquela categoria
            if (_store.products!.isEmpty && category != null) {
              return Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/not_found.png',
                    ),
                  ),
                  Text(
                    'Não foi encontrado nenhum produto para a categoria "$category"',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                ],
              );
              // Se não encontrar nenhum resultado retorna uma
              // mensagem informando ao usuário
            } else if (!_store.hasResults) {
              return Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/not_found.png',
                    ),
                  ),
                  const Text(
                    'Não foi encontrado nenhum produto no banco de dados',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: _store.products?.length ?? 0,
                itemBuilder: (context, idx) {
                  Product p = _store.products![idx];
                  return ProductList(product: p);
                },
              );
            }
          }
        },
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  static final _store = ProductsStore();

  final productsList = _store.products;
  List<String> recentSearchList = [];

  DataSearch({required this.recentSearchList});

  @override
  String get searchFieldLabel => 'Procurar';

  @override
  List<Widget>? buildActions(BuildContext context) {
    _store.loadProducts();
    // Actions da AppBar
    // (cria o botão de limpar oo texto da barra de pesquisa)
    return [
      IconButton(
          onPressed: () {
            if (query.isNotEmpty && !recentSearchList.contains(query)) {
              recentSearchList.insert(0, query);

              saveRecentSearches(recentSearchList);
            }
            query = '';
          },
          icon: const Icon(LineIcons.times))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Leading icon (botão de voltar)
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _store.products!
        .where((element) =>
            element.nome!.toLowerCase().contains(query) ||
            element.preco!
                .toStringAsFixed(2)
                .replaceAll('.', ',')
                .contains(query) ||
            element.categoria!.toLowerCase().contains(query))
        .toList();

    // Se não existirem resultados, retorna uma imagem
    // com a mensagem de resultado não encontrado
    if (results.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/not_found.png',
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Resultado não encontrado',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Não encontramos nenhum resultado parecido com "$query".',
                style: const TextStyle(
                  color: Color(0xff4A6569),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }

    // Se existirem resultados, retorna uma lista
    // dos produtos encontrados
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              color: Color(0xffF7F9FA),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${results.length} resultados encontrados',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 16),
              shrinkWrap: true,
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                final p = results[index];
                return ProductList(product: p);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Inicializa a lista de widgets de sugestões (pesquisas recentes)
    List<Widget> suggestionWidgets = [];

    // Adiciona as sugestões como ListTile widgets
    suggestionWidgets.addAll(
      recentSearchList.map((suggestion) {
        return ListTile(
          leading: const Icon(LineIcons.history),
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      }),
    );

    // Cria o ListView com as sugestões e um texto de "buscas recentes"
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          title: Text("Buscas Recentes"),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: recentSearchList.length,
          itemBuilder: (BuildContext context, int index) {
            return suggestionWidgets[index];
          },
        ),
      ],
    );
  }

  @override
  void close(BuildContext context, String? result) {
    if (query.isNotEmpty && !recentSearchList.contains(query)) {
      recentSearchList.insert(0, query);
      saveRecentSearches(recentSearchList);
    }
    super.close(context, result!);
  }

  // Salva as buscas recentes em uma lista de string usando a classe Prefs,
  // que implementa o SharedPreferences
  Future<void> saveRecentSearches(List<String> recentSearches) async {
    final prefs = Prefs();
    prefs.setStringList('recentSearches', recentSearches);
  }
}
