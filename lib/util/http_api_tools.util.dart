import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:test_aspirante_flutter/constants/key.constants.dart';

import 'package:test_aspirante_flutter/stores/user.store.dart';
import 'package:test_aspirante_flutter/view-models/login.viewmodel.dart';

class HttpApiTools {
  HttpApiTools(this.userStore, this.context);

  factory HttpApiTools.init(BuildContext context) => HttpApiTools(Provider.of<UserStore>(context), context);

  final UserStore userStore;
  final BuildContext context;

  Future<Map<String, dynamic>> header() async {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if(userStore.loginViewModel != null) {
      final LoginViewModel loginViewModel = await userStore.user();
      data[HttpHeaders.authorizationHeader] = 'Bearer ${loginViewModel.data.accessToken}';
    }
    data['api_key'] = KeyConstants.API_KEY;

    return data;
  }


}
