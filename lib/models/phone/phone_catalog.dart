import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_ecommerce_website_demo/models/phone/phone_model.dart';

class PhoneCatalog {
  List<PhoneModel>? phones;
  PhoneCatalog({
    this.phones,
  });

  PhoneCatalog copyWith({
    List<PhoneModel>? phones,
  }) {
    return PhoneCatalog(
      phones: phones ?? this.phones,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phones': phones?.map((x) => x.toMap()).toList(),
    };
  }

  factory PhoneCatalog.fromMap(Map<String, dynamic> map) {
    return PhoneCatalog(
      phones: map['phones'] != null
          ? List<PhoneModel>.from(
              map['phones']?.map(
                (x) => PhoneModel.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneCatalog.fromJson(String source) =>
      PhoneCatalog.fromMap(json.decode(source));

  @override
  String toString() => 'PhoneCatalog(phones: $phones)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneCatalog && listEquals(other.phones, phones);
  }

  @override
  int get hashCode => phones.hashCode;
}
