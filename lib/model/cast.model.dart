
class Cast {
  Cast({
    this.label,
    this.value,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    label: json['label'],
    value: List<String>.from(json['value'].map((dynamic x) => x)),
  );

  String label;
  List<String> value;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'label': label,
    'value': List<dynamic>.from(value.map<String>((String x) => x)),
  };
}
