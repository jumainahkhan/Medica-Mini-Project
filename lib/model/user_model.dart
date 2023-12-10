import 'package:image_picker/image_picker.dart';

class UserModel {
  String? uid;
  String? fullName;
  XFile? profileImageFile;
  String? phoneNumber;
  String? profilePicture;
  DateTime? dob;
  String? gender;

  UserModel({
    this.uid,
    this.fullName,
    this.profileImageFile,
    this.phoneNumber,
    this.profilePicture,
    this.dob,
    this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      profilePicture: json['profilePicture'],
      dob: DateTime.parse(json['dob']),
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'dob': dob?.toIso8601String(),
      'gender': gender,
    };
  }

  UserModel copyWith({
    String? uid,
    String? fullName,
    String? phoneNumber,
    String? profilePicture,
    DateTime? dob,
    String? gender,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, fullName: $fullName, profileImageFile: $profileImageFile, phoneNumber: $phoneNumber , profilePicture: $profilePicture, dob: $dob, gender: $gender)';
  }
}
