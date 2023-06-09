import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosofe_app/common/firebase_keys/firebase_keys.dart';

class UserData {
  final String name;
  final String emailAddress;
  final String password;
  final String phoneNumber;
  final String gender;
  final String image;

  UserData(
      {required this.name,
      required this.emailAddress,
      required this.password,
      required this.phoneNumber,
      required this.gender,
      this.image = ''});

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json[FireBaseUserKeys.name].toString(),
      emailAddress: json[FireBaseUserKeys.email].toString(),
      password: json[FireBaseUserKeys.password].toString(),
      phoneNumber: json[FireBaseUserKeys.phoneNumber].toString(),
      gender: json[FireBaseUserKeys.gender].toString(),
      image: json[FireBaseUserKeys.image].toString(),
    );
  }

  Map<String, dynamic> toMap({String image = ''}) {
    return {
      FireBaseUserKeys.name: name,
      FireBaseUserKeys.email: emailAddress,
      FireBaseUserKeys.password: password,
      FireBaseUserKeys.phoneNumber: phoneNumber,
      FireBaseUserKeys.gender: gender,
      FireBaseUserKeys.image: image,
    };
  }

  static UserData convert(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData.fromJson(data);
  }

  @override
  String toString() {
    return 'UserData{name: $name, emailAddress: $emailAddress, password: $password, phoneNumber: $phoneNumber, gender: $gender, image: $image}';
  }
}
