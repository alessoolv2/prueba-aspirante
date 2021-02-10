import 'package:test_aspirante_flutter/model/settings.model.dart';

List<CinemaModel> cinemaModelFromJson(List<dynamic> data) => List<CinemaModel>.from(data.map<dynamic>((dynamic x) => CinemaModel.fromJson(x)));

List<Map<String,dynamic>>  cinemaModelToJson(List<CinemaModel> data) => data.map((x) => x.toJson()).toList();


class CinemaModel {
  CinemaModel({
    this.id,
    this.vistaId,
    this.uris,
    this.cityId,
    this.name,
    this.lat,
    this.lng,
    this.phone,
    this.address,
    this.position,
    this.settings,
  });

  factory CinemaModel.fromJson(Map<String, dynamic> json) => CinemaModel(
    id: json['id'],
    vistaId: json['vista_id'],
    uris: json['uris'],
    cityId: json['city_id'],
    name: json['name'],
    lat: json['lat'],
    lng: json['lng'],
    phone: json['phone'],
    address: json['address'],
    position: json['position'],
    settings: Settings.fromJson(json['settings']),
  );

  int id;
  String vistaId;
  String uris;
  int cityId;
  String name;
  String lat;
  String lng;
  String phone;
  String address;
  int position;
  Settings settings;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'vista_id': vistaId,
    'uris': uris,
    'city_id': cityId,
    'name': name,
    'lat': lat,
    'lng': lng,
    'phone': phone,
    'address': address,
    'position': position,
    'settings': settings.toJson(),
  };
}

