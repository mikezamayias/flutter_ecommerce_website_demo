import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_model.freezed.dart';
part 'phone_model.g.dart';


@Freezed()
class PhoneModel with _$PhoneModel {
  @JsonSerializable(explicitToJson: true)
  factory PhoneModel({
    String? uid,
    String? model,
    String? photoUrl,
    String? soc,
    int? ram,
    String? storage,
    double? screenSize,
    int? battery,
    String? camera,
    double? price,
    int? quantity,
    double? sar,
  }) = _PhoneModel;

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);
}