import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/app.localizations.dart';
import 'package:test_aspirante_flutter/controllers/billboard.controller.dart';
import 'package:test_aspirante_flutter/model/billboard.model.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';
import 'package:test_aspirante_flutter/ui/widgets/billboard/grid_view_item.widget.dart';
import 'package:test_aspirante_flutter/ui/widgets/billboard/shimmer_list_billboard.widget.dart';

class BillboardView extends StatefulWidget {
  @override
  _BillboardState createState() => _BillboardState();
}

class _BillboardState extends State<BillboardView> {

  BillboardController billboardController;

  @override
  void didChangeDependencies() {
    billboardController ??= BillboardController.init(context);
    if(billboardController.billboardStore.billboardViewModel == null){
      billboardController.getBillboard();
    }
    super.didChangeDependencies();
  }

  //GetList of items in billboard
  List<Widget> getList({Function onTap,}){
    final List<Movie> data = billboardController.billboardStore.billboardViewModel.data.movies;
    return List<GridViewItem>.generate(
        data.length, (int index) {
      final Movie movieModel = data[index];
      return GridViewItem(
        title: movieModel.name,
        imageUrl: BillboardController.imageUrl(movieModel.media[0].resource),
        onTap:() => onTap(index),
        condition: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 16.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            //Title
            Container(
              margin: const EdgeInsets.only(left: 16.0, bottom: 4.0),
              child: Text(
                AppLocalizations.of(context).translate('billboard.title'),
                style: StyleTheme.theme.textTheme.headline5,
              ),
            ),
            //List of billboard
            Observer(
              builder: (_) => ConditionalSwitch.single<FutureStatus>(
                context: context,
                valueBuilder: (BuildContext context) => billboardController.billboardStore.loadBillboardFuture.status ,
                caseBuilders: {
                  FutureStatus.pending: (BuildContext context) => ShimmerListBillboard(),
                  FutureStatus.fulfilled: (BuildContext context) {
                    final BillboardModel billboardModel = billboardController.billboardStore.billboardViewModel.data;

                    return Conditional.single(
                      context: context,
                      conditionBuilder: (BuildContext context) => billboardModel == null,
                      widgetBuilder: (BuildContext context) => ShimmerListBillboard(),
                      fallbackBuilder: (BuildContext context) => Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 29.0,
                            mainAxisSpacing: 24.0,
                            childAspectRatio: 0.58,
                            children: getList(onTap: (int index) {
                              billboardController.goDetails(index);
                            }),
                          ),
                        ),
                      ),
                    );
                  }
                },
                fallbackBuilder:(BuildContext context) => ShimmerListBillboard(),
              ),
            ),
          ],
        )
      ),
    );
  }
}


