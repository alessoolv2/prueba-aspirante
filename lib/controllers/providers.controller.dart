import 'package:provider/provider.dart';
import 'package:test_aspirante_flutter/stores/billboard.store.dart';
import 'package:test_aspirante_flutter/stores/cinema.store.dart';
import 'package:test_aspirante_flutter/stores/login.store.dart';
import 'package:test_aspirante_flutter/stores/pages.store.dart';
import 'package:test_aspirante_flutter/stores/profile.store.dart';
import 'package:test_aspirante_flutter/stores/user.store.dart';

class ProvidersController {
  static List<Provider> get providers {
    return [
      Provider<PagesStore>(create: (_) => PagesStore()),
      Provider<LoginStore>(create: (_) => LoginStore()),
      Provider<UserStore>(create: (_) => UserStore()),
      Provider<ProfileStore>(create: (_) => ProfileStore(),),
      Provider<BillboardStore>(create: (_) => BillboardStore(),),
      Provider<CinemaStore>(create: (_) => CinemaStore(),)
    ];
  }
}