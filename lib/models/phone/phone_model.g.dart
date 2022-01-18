// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhoneModel _$$_PhoneModelFromJson(Map<String, dynamic> json) =>
    _$_PhoneModel(
      uid: json['uid'] as String?,
      model: json['model'] as String?,
      photoUrl: json['photoUrl'] as String?,
      soc: json['soc'] as String?,
      ram: json['ram'] as int?,
      storage: json['storage'] as String?,
      screenSize: (json['screenSize'] as num?)?.toDouble(),
      battery: json['battery'] as int?,
      camera: json['camera'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      sar: (json['sar'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PhoneModelToJson(_$_PhoneModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'model': instance.model,
      'photoUrl': instance.photoUrl,
      'soc': instance.soc,
      'ram': instance.ram,
      'storage': instance.storage,
      'screenSize': instance.screenSize,
      'battery': instance.battery,
      'camera': instance.camera,
      'price': instance.price,
      'quantity': instance.quantity,
      'sar': instance.sar,
    };
