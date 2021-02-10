import 'package:dio/dio.dart';
import 'package:test_aspirante_flutter/constants/api.constants.dart';
import 'package:test_aspirante_flutter/constants/key.constants.dart';
import 'package:test_aspirante_flutter/model/login.model.dart';
import 'package:test_aspirante_flutter/model/login_response.model.dart';
import 'package:test_aspirante_flutter/view-models/login.viewmodel.dart';

class LoginRepository {

  Future<LoginViewModel> login(LoginModel model) async {
    final LoginViewModel viewModel = LoginViewModel();
    final Map<String, dynamic> queryParameters = Map<String, dynamic>();

    queryParameters['client_secret'] = KeyConstants.SECRET;
    queryParameters['client_id'] = KeyConstants.CLIENT_ID;
    queryParameters['grant_type'] = KeyConstants.GRANT_TYPE;
    queryParameters['country_code'] = KeyConstants.COUNTRY_CODE;
    queryParameters['username'] = model.user;
    queryParameters['password'] = model.password;

    try {
      final Response response = await Dio().post<dynamic>(
        ApiConstants.login,
        data: queryParameters,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: <String, dynamic>{
            'api_key':KeyConstants.API_KEY
          }
        ),
      );

      if (response.statusCode == 200) {

        final LoginResponseModel moviesModel =  loginResponseFromJson(response.data);
        viewModel.success = true;
        viewModel.data = moviesModel;
      }
      else{
        viewModel.success = false;
        viewModel.message = response.statusCode.toString();
      }

    } catch (e, stacktrace) {
      print('Exception occurred: $e stackTrace: $stacktrace');
    }

    return viewModel;
  }

}