// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      streetAddress: json['streetAddress'] as String?,
      userOrdersUid: json['userOrdersUid'] as String?,
      userCartUid: json['userCartUid'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'streetAddress': instance.streetAddress,
      'userOrdersUid': instance.userOrdersUid,
      'userCartUid': instance.userCartUid,
    };
