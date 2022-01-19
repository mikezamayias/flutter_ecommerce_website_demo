import 'dart:convert';

class PhoneModel {
  String? uid;
  String? model;
  String? photoUrl;
  String? soc;
  int? ram;
  String? storage;
  double? screenSize;
  int? battery;
  String? camera;
  double? price;
  int? stock;
  double? sar;

  PhoneModel({
    this.uid,
    this.model,
    this.photoUrl,
    this.soc,
    this.ram,
    this.storage,
    this.screenSize,
    this.battery,
    this.camera,
    this.price,
    this.stock,
    this.sar,
  });

  PhoneModel copyWith({
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
    int? stock,
    double? sar,
  }) {
    return PhoneModel(
      uid: uid ?? this.uid,
      model: model ?? this.model,
      photoUrl: photoUrl ?? this.photoUrl,
      soc: soc ?? this.soc,
      ram: ram ?? this.ram,
      storage: storage ?? this.storage,
      screenSize: screenSize ?? this.screenSize,
      battery: battery ?? this.battery,
      camera: camera ?? this.camera,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      sar: sar ?? this.sar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'model': model,
      'photoUrl': photoUrl,
      'soc': soc,
      'ram': ram,
      'storage': storage,
      'screenSize': screenSize,
      'battery': battery,
      'camera': camera,
      'price': price,
      'stock': stock,
      'sar': sar,
    };
  }

  factory PhoneModel.fromMap(Map<String, dynamic> map) {
    return PhoneModel(
      uid: map['uid'],
      model: map['model'],
      photoUrl: map['photoUrl'],
      soc: map['soc'],
      ram: map['ram']?.toInt(),
      storage: map['storage'],
      screenSize: map['screenSize']?.toDouble(),
      battery: map['battery']?.toInt(),
      camera: map['camera'],
      price: map['price']?.toDouble(),
      stock: map['stock']?.toInt(),
      sar: map['sar']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PhoneModel.fromJson(String source) =>
      PhoneModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhoneModel(uid: $uid, model: $model, photoUrl: $photoUrl, soc: $soc, ram: $ram, storage: $storage, screenSize: $screenSize, battery: $battery, camera: $camera, price: $price, stock: $stock, sar: $sar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhoneModel &&
        other.uid == uid &&
        other.model == model &&
        other.photoUrl == photoUrl &&
        other.soc == soc &&
        other.ram == ram &&
        other.storage == storage &&
        other.screenSize == screenSize &&
        other.battery == battery &&
        other.camera == camera &&
        other.price == price &&
        other.stock == stock &&
        other.sar == sar;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        model.hashCode ^
        photoUrl.hashCode ^
        soc.hashCode ^
        ram.hashCode ^
        storage.hashCode ^
        screenSize.hashCode ^
        battery.hashCode ^
        camera.hashCode ^
        price.hashCode ^
        stock.hashCode ^
        sar.hashCode;
  }
}
