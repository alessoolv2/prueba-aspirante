class Sizes {
  Sizes({
    this.large,
    this.medium,
    this.small,
    this.xLarge,
  });

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
    large: json['large'],
    medium: json['medium'],
    small: json['small'],
    xLarge: json['x-large'],
  );

  String large;
  String medium;
  String small;
  String xLarge;

  Map<String, dynamic> toJson() => <String, dynamic> {
    'large': large,
    'medium': medium,
    'small': small,
    'x-large': xLarge ?? null,
  };
}