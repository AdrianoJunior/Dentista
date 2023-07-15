import 'package:dentist/app/modules/home/pages/add_page.dart';
import 'package:dentist/app/modules/home/pages/products/categories_page.dart';
import 'package:dentist/app/modules/home/pages/favorites_page.dart';
import 'package:dentist/app/modules/home/pages/products/list_page.dart';
import 'package:dentist/app/modules/home/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
            ),
          ],
        ),
        child: GNav(
            gap: 8,
            padding: const EdgeInsets.all(8),
            activeColor: const Color(0xff00B4CC),
            color: const Color(0xff7C9094),
            backgroundColor: Colors.white,
            tabActiveBorder: Border.all(color: Colors.grey, width: 1),
            tabMargin: const EdgeInsets.all(8),
            onTabChange: (idx) {
              _controller.animateToPage(idx,
                  duration: const Duration(
                    milliseconds: 5,
                  ),
                  curve: Curves.linear);
            },
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.listUl,
                text: 'Categorias',
              ),
              GButton(
                icon: LineIcons.plusCircle,
                text: 'Anunciar',
              ),
              GButton(
                icon: LineIcons.heartAlt,
                text: 'Favoritos',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Conta',
              ),
            ]),
      ),
    );
  }

  _body() {
    return PageView(
      controller: _controller,
      children: [
        ListPage(),
        CategoriesPage(),
        AddPage(),
        FavoritesPage(),
        ProfilePage(),
      ],
    );
  }
}
