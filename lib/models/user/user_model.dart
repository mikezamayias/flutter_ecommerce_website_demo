import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? address,
    String? city,
    String? postalCode,
    String? userOrdersUid,
    String? userCartUid,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
