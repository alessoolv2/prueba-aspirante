import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:test_aspirante_flutter/app.localizations.dart';
import 'package:test_aspirante_flutter/controllers/providers.controller.dart';
import 'package:test_aspirante_flutter/controllers/storage.controller.dart';
import 'package:test_aspirante_flutter/router/navigation.router.dart';
import 'package:test_aspirante_flutter/router/routes.router.dart';
import 'package:test_aspirante_flutter/stores/locator/locator.store.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';
import 'package:test_aspirante_flutter/ui/views/splash_screen.view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocatorStore.setupLocator();
  final StorageController _storageController = LocatorStore.locator<StorageController>();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
          (_) => _storageController.initDB().then((_) => runApp(MainApp())) );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  NavigatorRouter router = NavigatorRouter();

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: ProvidersController.providers,
      child: MaterialApp(
        title: 'Test Aspirante',
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          const Locale('es'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: StyleTheme.theme,
        navigatorKey: router.navigator,
        routes: RoutesRouter.routes,
        home: SplashScreen(),
      ),
    );
  }
}

