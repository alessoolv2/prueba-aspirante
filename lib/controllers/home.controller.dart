import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aspirante_flutter/stores/billboard.store.dart';
import 'package:test_aspirante_flutter/stores/pages.store.dart';

class HomeController {
  HomeController(this.context, this.pagesStore, this.billboardStore);

  factory HomeController.init(BuildContext context) {
    final PagesStore pagesStore = Provider.of<PagesStore>(context);
    final BillboardStore billboardStore = Provider.of<BillboardStore>(context);
    pagesStore.initController();
    return HomeController(context, pagesStore, billboardStore);
  }

  final BuildContext context;
  final PagesStore pagesStore;
  final BillboardStore billboardStore;

  void changePage(int index) {
    pagesStore.changePage(index);
  }
}