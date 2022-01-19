import 'dart:convert';

class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? streetAddress;
  String? userOrdersUid;
  String? userCartUid;
  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.streetAddress,
    this.userOrdersUid,
    this.userCartUid,
  });

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? streetAddress,
    String? userOrdersUid,
    String? userCartUid,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      streetAddress: streetAddress ?? this.streetAddress,
      userOrdersUid: userOrdersUid ?? this.userOrdersUid,
      userCartUid: userCartUid ?? this.userCartUid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'streetAddress': streetAddress,
      'userOrdersUid': userOrdersUid,
      'userCartUid': userCartUid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      streetAddress: map['streetAddress'],
      userOrdersUid: map['userOrdersUid'],
      userCartUid: map['userCartUid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, streetAddress: $streetAddress, userOrdersUid: $userOrdersUid, userCartUid: $userCartUid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.phoneNumber == phoneNumber &&
      other.streetAddress == streetAddress &&
      other.userOrdersUid == userOrdersUid &&
      other.userCartUid == userCartUid;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      streetAddress.hashCode ^
      userOrdersUid.hashCode ^
      userCartUid.hashCode;
  }
}
