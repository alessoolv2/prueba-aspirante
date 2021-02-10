LoginResponseModel loginResponseFromJson(Map<String,dynamic> data) => LoginResponseModel.fromJson(data);

Map<String, dynamic> loginResponseToJson(LoginResponseModel data) =>data.toJson();

class LoginResponseModel {
  LoginResponseModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.asClientId,
    this.username,
    this.countryCode,
    this.issued,
    this.expires,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    accessToken: json['access_token'],
    tokenType: json['token_type'],
    expiresIn: json['expires_in'],
    refreshToken: json['refresh_token'],
    asClientId: json['as:client_id'],
    username: json['username'],
    countryCode: json['country_code'],
    issued: json['.issued'],
    expires: json['.expires'],
  );

  factory LoginResponseModel.fromDatabase(Map<String, dynamic> json) => LoginResponseModel(
    accessToken: json['access_token'],
    tokenType: json['token_type'],
    expiresIn: json['expires_in'],
    refreshToken: json['refresh_token'],
    asClientId: json['as_client_id'],
    username: json['username'],
    countryCode: json['country_code'],
    issued: json['issued'],
    expires: json['expires'],
  );

  String accessToken;
  String tokenType;
  int expiresIn;
  String refreshToken;
  String asClientId;
  String username;
  String countryCode;
  String issued;
  String expires;



  Map<String, dynamic> toJson() => <String, dynamic>{
    'access_token': accessToken,
    'token_type': tokenType,
    'expires_in': expiresIn,
    'refresh_token': refreshToken,
    'as_client_id': asClientId,
    'username': username,
    'country_code': countryCode,
    'issued': issued,
    'expires': expires,
  };
}
