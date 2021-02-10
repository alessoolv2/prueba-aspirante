import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_aspirante_flutter/controllers/login.controller.dart';
import 'package:test_aspirante_flutter/model/login.model.dart';
import 'package:test_aspirante_flutter/themes/style.theme.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController _controller;


  @override
  void didChangeDependencies() {
    _controller ??= LoginController.init(context);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 27, left: 17),
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 27),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text(
                      'Cinema',
                      textAlign: TextAlign.left,
                      style: StyleTheme.theme.textTheme.headline3,
                    ),
                  ),

                  AutofillGroup(
                      child: Form(
                          key: _controller.formKey,
                          child: FocusScope(
                            node: _controller.node,
                            child: Column(
                              children: [
                                //User
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 18, left: 16, right: 16),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    autofillHints: [AutofillHints.email],
                                    onEditingComplete: _controller.node.nextFocus,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 2.0),
                                      isDense: true,
                                      labelText: 'Usuario',
                                      labelStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (!_controller.validUser(value)) {
                                        return 'No puede estar vacio este campo';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      _controller.model.user = value;
                                    },
                                    onSaved: (value) {
                                      _controller.model.user = value;
                                    },
                                  ),
                                ),

                                // Password
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 18, left: 16, right: 16),
                                  child: TextFormField(
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    autofillHints: [AutofillHints.password],
                                    onEditingComplete: _controller.node.nextFocus,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 2.0),
                                      isDense: true,
                                      labelText: 'Contraseña',
                                      labelStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'La contraseña no puede estar vacia';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      _controller.model.password = value;
                                    },
                                    onSaved: (value) {
                                      _controller.model.password = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                  ),

                  // Divider
                  Container(
                    height: 1.5,
                    margin:
                    const EdgeInsets.only(top: 17, left: 16, right: 16),
                    child: const Divider(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              width: MediaQuery.of(context).size.width,
              height: 35,
              margin:
              const EdgeInsets.only(top: 17, left: 16, right: 16, bottom: 20),
              child: RaisedButton(
                  child: const Text(
                    'Ingresar',
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed:() {
                    if (_controller.formKey.currentState.validate()) {
                      _controller.login();
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
