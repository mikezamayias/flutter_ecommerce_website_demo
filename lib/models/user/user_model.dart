import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? streetAddress;
  int? postalCode;
  String? city;
  List<String>? cart;
  List<String>? orders;
  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.streetAddress,
    this.postalCode,
    this.city,
    this.cart,
    this.orders,
  });

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? streetAddress,
    int? postalCode,
    String? city,
    List<String>? cart,
    List<String>? orders,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      streetAddress: streetAddress ?? this.streetAddress,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      cart: cart ?? this.cart,
      orders: orders ?? this.orders,
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
      'postalCode': postalCode,
      'city': city,
      'cart': cart,
      'orders': orders,
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
      postalCode: map['postalCode']?.toInt(),
      city: map['city'],
      cart: List<String>.from(map['cart']),
      orders: List<String>.from(map['orders']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, streetAddress: $streetAddress, postalCode: $postalCode, city: $city, cart: $cart, orders: $orders)';
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
        other.postalCode == postalCode &&
        other.city == city &&
        listEquals(other.cart, cart) &&
        listEquals(other.orders, orders);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        streetAddress.hashCode ^
        postalCode.hashCode ^
        city.hashCode ^
        cart.hashCode ^
        orders.hashCode;
  }

}
