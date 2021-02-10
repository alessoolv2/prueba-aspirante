ProfileModel profileFromJson(Map<String,dynamic> data) => ProfileModel.fromJson(data);

Map<String, dynamic> profileToJson(ProfileModel data) =>data.toJson();

class ProfileModel {
  ProfileModel({
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePicture,
    this.cardNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    email: json['email'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    phoneNumber: json['phone_number'],
    profilePicture: json['profile_picture'],
    cardNumber: json['card_number'],
  );

  factory ProfileModel.fromDatabase(Map<String, dynamic> json) => ProfileModel(
    email: json['email'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    phoneNumber: json['phone_number'],
    profilePicture: json['profile_picture'],
    cardNumber: json['card_number'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'phone_number': phoneNumber,
    'profile_picture': profilePicture,
    'card_number': cardNumber,
  };

  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;
  String cardNumber;


}
