import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_aspirante_flutter/constants/api.constants.dart';
import 'package:test_aspirante_flutter/model/billboard.model.dart';
import 'package:test_aspirante_flutter/util/http_api_tools.util.dart';
import 'package:test_aspirante_flutter/view-models/billboard.viewmodel.dart';

class BillboardRepository {

  Future<BillboardViewModel> getBillboard(BuildContext context) async {
    final HttpApiTools httpApiTools = HttpApiTools.init(context);
    final BillboardViewModel viewModel = BillboardViewModel();
    final Map<String, dynamic> queryParameters = <String, dynamic> {
      'country_code':'MX',
      'cinema': 61,
    };
    try {
      final Response<dynamic> response = await Dio().get<dynamic>(
        ApiConstants.billboard,
        queryParameters: queryParameters,
        options: Options(
          headers: await httpApiTools.header(),
        ),
      );

      if (response.statusCode == 200) {

        final BillboardModel billboardModel =  billboardModelFromJson(response.data);
        viewModel.success = true;
        viewModel.data = billboardModel;
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