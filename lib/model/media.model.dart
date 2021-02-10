class Media {
  Media({
    this.resource,
    this.type,
    this.code,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    resource: json['resource'],
    type: json['type'],
    code: json['code'],
  );

  String resource;
  String type;
  String code;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resource': resource,
    'type': type,
    'code': code,
  };
}
