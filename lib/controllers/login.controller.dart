import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aspirante_flutter/model/login.model.dart';
import 'package:test_aspirante_flutter/repositories/login.repository.dart';
import 'package:test_aspirante_flutter/router/navigation.router.dart';
import 'package:test_aspirante_flutter/router/routes.router.dart';
import 'package:test_aspirante_flutter/stores/login.store.dart';
import 'package:test_aspirante_flutter/ui/widgets/loader.widget.dart';

class LoginController {

  LoginController(this.context, this.loginStore);

  factory LoginController.init(BuildContext context) => LoginController(context, Provider.of<LoginStore>(context));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusScopeNode node = FocusScopeNode();
  LoginModel model = LoginModel();
  NavigatorRouter navigatorRouter = NavigatorRouter();

  final BuildContext context;
  final LoginStore loginStore;



  bool validUser(String user){
    if(user != null) {
      if(user.isNotEmpty){
        return true;
      }
    }
    return false;
  }

  void login(){
    Loader.show(context);
    loginStore.login(LoginModel(user: model.user, password:model.password)).then((value) {
      navigatorRouter.goPage(RoutesRouter.HOME_VIEW);
    });
  }

  void createAccountView() {
    navigatorRouter.goPage(RoutesRouter.HOME_VIEW);
  }

}