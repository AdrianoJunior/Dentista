import 'package:dentist/app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductList extends StatelessWidget {
  const ProductList({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Modular.to.pushNamed('/details/', arguments: product);
          },
          leading: Image.network(
            product.image!,
            fit: BoxFit.cover,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.nome ?? 'Nome do produto',
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              Text(
                'R\$ ${product.preco!.toStringAsFixed(2).replaceAll(".", ',')}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.parcela ?? "Parcelamento",
                style: const TextStyle(color: Color(0xff00B4CC), fontSize: 16),
              ),
            ],
          ),
          subtitle: Text(
            product.condicao ?? "Condição do item",
            style: const TextStyle(color: Color(0xff7c9094), fontSize: 14),
          ),
        ),
        const Divider(
          color: Color(0xffEBF1F4),
          thickness: 2,
        ),
      ],
    );
  }
}
