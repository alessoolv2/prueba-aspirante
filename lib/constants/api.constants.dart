import 'package:test_aspirante_flutter/settings.dart';

class ApiConstants {
  static String get login => '${Settings.API_URL}/v2/oauth/token';
  static String get profile => '${Settings.API_URL}/v1/members/profile';
  static String get billboard => '${Settings.API_URL}/v2/movies';
  static String get cinemas => '${Settings.API_URL}/v2/locations/cinemas';

}
