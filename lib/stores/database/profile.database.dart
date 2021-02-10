import 'package:test_aspirante_flutter/controllers/storage.controller.dart';
import 'package:test_aspirante_flutter/model/profile.model.dart';
import 'package:test_aspirante_flutter/stores/locator/locator.store.dart';
import 'package:test_aspirante_flutter/util/tables.util.dart';
import 'package:test_aspirante_flutter/view-models/profile.viewmodel.dart';

class ProfileDatabase {
  static const String TABLE_NAME = 'profile';

  static String get table {
    final Map<String, String> columns = <String, String>{
      'email': TablesUtil.TEXT,
      'first_name' : TablesUtil.TEXT,
      'last_name': TablesUtil.TEXT,
      'phone_number': TablesUtil.TEXT,
      'profile_picture': TablesUtil.TEXT,
      'card_number': TablesUtil.TEXT,
    };

    return TablesUtil.createTable(TABLE_NAME, columns);
  }

  final StorageController _storageController = LocatorStore.locator<StorageController>();

  Future<ProfileViewModel> getProfile() async {
    final List<Map<String, dynamic>> mapUser = await _storageController.database.query(TABLE_NAME);
    if(mapUser != null && mapUser.isNotEmpty) {

      final ProfileModel responseModel = ProfileModel.fromDatabase(mapUser[0]);
      final ProfileViewModel viewModel = ProfileViewModel();

      viewModel.data = responseModel;
      viewModel.success = true;
      viewModel.message = '';

      return viewModel;
    }

    return null;
  }

}