import 'package:test_aspirante_flutter/model/sizes.model.dart';

class Route {
  Route({
    this.code,
    this.sizes,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    code: json['code'],
    sizes: Sizes.fromJson(json['sizes']),
  );

  String code;
  Sizes sizes;


  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    'sizes': sizes.toJson(),
  };
}