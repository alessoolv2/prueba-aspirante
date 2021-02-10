import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:test_aspirante_flutter/controllers/profile.controller.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';
import 'package:test_aspirante_flutter/ui/widgets/item.settings.widget.dart';
import 'package:test_aspirante_flutter/ui/widgets/photo_header.widget.dart';
import 'package:test_aspirante_flutter/ui/widgets/shimmer_item.settings.widget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileController;


  @override
  void didChangeDependencies() {
    profileController ??= ProfileController.init(context);

    if(profileController.userStore.loginViewModel == null) {
      profileController.user;
    }
    profileController.profileData;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16.0, bottom: 4.0, top: 16.0),
              child: Text(
                'Perfil',
                style: StyleTheme.theme.textTheme.headline5,
              ),
            ),
            PhotoHeader(),

            Observer(builder: (_) => ConditionalSwitch.single<FutureStatus>(
              context: context,
              valueBuilder: (BuildContext context) => profileController.profileStore.loadProfileFuture.status,
              caseBuilders: {
                FutureStatus.rejected: (BuildContext context) => const ShimmerItemSettings(title: 'Bienvenido',),
                FutureStatus.fulfilled: (BuildContext context) => Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) => profileController.profileStore.profileViewModel.success,
                  widgetBuilder: (BuildContext context) => ItemSettings(title: 'Bienvenido',text: '${profileController.fullName}', icon: Icons.account_circle,),
                  fallbackBuilder: (BuildContext context) =>  const ShimmerItemSettings(title: 'Bienvenido',),
                ),
              },
              fallbackBuilder:  (BuildContext context) => const ShimmerItemSettings(title: 'Bienvenido',),
            ),),


            Observer(builder: (_) => ConditionalSwitch.single<FutureStatus>(
              context: context,
              valueBuilder: (BuildContext context) => profileController.userStore.loadLoginFuture.status,
              caseBuilders: {
                FutureStatus.rejected: (BuildContext context) => const ShimmerItemSettings(title: 'Correo Electronico',),
                FutureStatus.fulfilled: (BuildContext context) {
                  return Conditional.single(
                    context: context,
                    conditionBuilder: (BuildContext context) => profileController.profileStore.profileViewModel.success,
                    widgetBuilder: (BuildContext context) => ItemSettings(title: 'Correo Electronico',text: '${profileController.userStore.loginViewModel.data.username}', icon: Icons.email),
                    fallbackBuilder: (BuildContext context) =>  const ShimmerItemSettings(title: 'Correo Electronico',),
                  );
                }
              },
              fallbackBuilder:  (BuildContext context) => const ShimmerItemSettings(title: 'Correo Electronico',),
            ),),


            Observer(builder: (_) =>  ConditionalSwitch.single<FutureStatus>(
              context: context,
              valueBuilder: (BuildContext context) => profileController.profileStore.loadProfileFuture.status,
              caseBuilders: {
                FutureStatus.rejected: (BuildContext context) => const ShimmerItemSettings(title: 'Tarjeta',),
                FutureStatus.fulfilled: (BuildContext context) => Conditional.single(
                  context: context,
                  conditionBuilder: (BuildContext context) => profileController.profileStore.profileViewModel.success,
                  widgetBuilder: (BuildContext context) => ItemSettings(title: 'Tarjeta',text: '${profileController.profileStore.profileViewModel.data.cardNumber}', icon: Icons.account_balance_wallet_outlined),
                  fallbackBuilder: (BuildContext context) =>  const ShimmerItemSettings(title: 'Tarjeta',),
                ),
              },
              fallbackBuilder:  (BuildContext context) => const ShimmerItemSettings(title: 'Bienvenido',),
             ),
            ),



          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 35,
        margin: const EdgeInsets.only(
            left: 15, right: 15, top: 10, bottom: 50),
        child: RaisedButton(
          child: Text(
            'Salir',
            style: StyleTheme.theme.textTheme.headline4.copyWith(color: Colors.red),
          ),
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(color: Colors.red)),
          onPressed: profileController.logout,
        ),
      ),
    );
  }
}
