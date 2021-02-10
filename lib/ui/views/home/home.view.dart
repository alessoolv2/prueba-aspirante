import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_aspirante_flutter/controllers/home.controller.dart';
import 'package:test_aspirante_flutter/ui/views/billboard.view.dart';
import 'package:test_aspirante_flutter/ui/views/cinema.view.dart';
import 'package:test_aspirante_flutter/ui/views/movie_details.view.dart';
import 'package:test_aspirante_flutter/ui/views/profile.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeController _controller;

  @override
  Widget build(BuildContext context) {
    _controller ??=  HomeController.init(context);
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => IndexedStack(
            index: _controller.pagesStore.currentPage,
            children: [
              ProfileView(),
              Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) => _controller.billboardStore.index == -1,
                  widgetBuilder: (BuildContext context) => BillboardView(),
                  fallbackBuilder: (BuildContext context) => MovieDetailsView(),
              ),
              CinemaView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          currentIndex: _controller.pagesStore.currentPage,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
              label: 'Perfil',

            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Cartelera',

            ),
            const  BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Complejo',
            ),
          ],
          onTap: (index) {
            if(index == 1){
              _controller.billboardStore.setIndex(-1);
            }
          _controller.changePage(index);
          }
        ),
      ),

    );
  }
}
