import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_aspirante_flutter/constants/api.constants.dart';
import 'package:test_aspirante_flutter/model/cinemas.model.dart';
import 'package:test_aspirante_flutter/util/http_api_tools.util.dart';
import 'package:test_aspirante_flutter/view-models/cinema.viewmodel.dart';

class CinemasRepository {

  Future<CinemaViewModel> getCinemas(BuildContext context) async {
    final HttpApiTools httpApiTools = HttpApiTools.init(context);
    final CinemaViewModel viewModel = CinemaViewModel();
    final Map<String, dynamic> queryParameters = <String, dynamic> {
      'country_code':'MX',
      'cities': 61,
    };
    try {
      final Response<dynamic> response = await Dio().get<dynamic>(
        ApiConstants.cinemas,
        queryParameters: queryParameters,
        options: Options(
          headers: await httpApiTools.header(),
        ),
      );

      if (response.statusCode == 200) {

        final List<CinemaModel> cinemaModels =  cinemaModelFromJson(response.data);
        viewModel.success = true;
        viewModel.data = cinemaModels;
      }
      else {
        viewModel.success = false;
        viewModel.message = response.statusCode.toString();
      }


    } catch (e, stacktrace) {
      print('Exception occurred: $e stackTrace: $stacktrace');

    }

    return viewModel;
  }

}