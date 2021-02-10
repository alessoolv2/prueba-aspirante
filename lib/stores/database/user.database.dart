import 'package:test_aspirante_flutter/controllers/storage.controller.dart';
import 'package:test_aspirante_flutter/model/login_response.model.dart';
import 'package:test_aspirante_flutter/stores/locator/locator.store.dart';
import 'package:test_aspirante_flutter/util/tables.util.dart';
import 'package:test_aspirante_flutter/view-models/login.viewmodel.dart';

class UserDatabase {
  static const String TABLE_NAME = 'user';

  static String get table {
    final Map<String, String> columns = <String, String>{
      'access_token': TablesUtil.TEXT,
      'token_type' : TablesUtil.TEXT,
      'expires_in': TablesUtil.INTEGER,
      'refresh_token': TablesUtil.TEXT,
      'as_client_id': TablesUtil.TEXT,
      'username': TablesUtil.TEXT,
      'country_code': TablesUtil.TEXT,
      'issued': TablesUtil.TEXT,
      'expires': TablesUtil.TEXT,
    };

    return TablesUtil.createTable(TABLE_NAME, columns);
  }

  final StorageController _storageController = LocatorStore.locator<StorageController>();

  Future<LoginViewModel> getUser() async {
    final List<Map<String, dynamic>> mapUser = await _storageController.database.query(TABLE_NAME);
    if(mapUser != null && mapUser.isNotEmpty) {

      final LoginResponseModel responseModel = LoginResponseModel.fromDatabase(mapUser[0]);
      final LoginViewModel viewModel = LoginViewModel();

      viewModel.data = responseModel;
      viewModel.success = true;
      viewModel.message = '';

      return viewModel;
    }

    return null;
  }

  void deleteUser() {
    _storageController.database.rawDelete('DELETE FROM $TABLE_NAME');
  }

}