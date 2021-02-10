import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_aspirante_flutter/constants/api.constants.dart';
import 'package:test_aspirante_flutter/model/profile.model.dart';
import 'package:test_aspirante_flutter/util/http_api_tools.util.dart';
import 'package:test_aspirante_flutter/view-models/profile.viewmodel.dart';

class ProfileRepository {

  Future<ProfileViewModel> profile(BuildContext context) async {
    final HttpApiTools httpApiTools = HttpApiTools.init(context);
    final ProfileViewModel viewModel = ProfileViewModel();
    final Map<String, dynamic> queryParameters = <String, dynamic> {
      'country_code':'MX',
    };
    try {
      final Response<dynamic> response = await Dio().get<dynamic>(
        ApiConstants.profile,
        queryParameters: queryParameters,
        options: Options(
            headers: await httpApiTools.header(),
        ),
      );

      if (response.statusCode == 200) {

        final ProfileModel moviesModel =  profileFromJson(response.data);
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