import 'package:dentist/app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatelessWidget {
  Product product;

  DetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 16,
            floating: true,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  product.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  elevation: 24,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(product.nome ?? 'Nome do Produto'),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'R\$ ${product.preco?.toStringAsFixed(2).replaceAll(".", ',')}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    product.parcela ?? "Parcelamento",
                                    style:
                                        const TextStyle(color: Color(0xff00B4CC)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text('Descrição'),
                          subtitle: ListView.builder(
                            padding: EdgeInsets.only(top: 16),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: product.descricao?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                '- ${product.descricao?[index]}',
                                style: const TextStyle(fontSize: 16),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
