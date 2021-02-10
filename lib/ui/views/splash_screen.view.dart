import 'package:flutter/material.dart';
import 'package:test_aspirante_flutter/app.localizations.dart';
import 'package:test_aspirante_flutter/router/navigation.router.dart';
import 'package:test_aspirante_flutter/router/routes.router.dart';
import 'package:test_aspirante_flutter/stores/database/user.database.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';
import 'package:test_aspirante_flutter/view-models/login.viewmodel.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final UserDatabase userDatabase = UserDatabase();
  final NavigatorRouter navigatorRouter = NavigatorRouter();

  @override
  void didChangeDependencies() {
    userDatabase.getUser().then((LoginViewModel value) {
      if(value != null){
        if(value.success){
          navigatorRouter.goPage(RoutesRouter.HOME_VIEW);
        } else {
          navigatorRouter.goPage(RoutesRouter.LOGIN_VIEW);
        }
      }
      else {
        navigatorRouter.goPage(RoutesRouter.LOGIN_VIEW);
      }
    });
    super.didChangeDependencies();
  }

  //SplashScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleTheme.primaryColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 27),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,

          //AppName
          child: Text(
            AppLocalizations.of(context)
                .translate('appTitle'),
            textAlign: TextAlign.left,
            style: StyleTheme.theme.textTheme.headline3.copyWith(color: Colors.white, fontSize: 48.0),
          ),
        ),
      ),
    );

  }
}

