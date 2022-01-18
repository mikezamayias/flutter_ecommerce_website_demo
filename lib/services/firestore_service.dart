import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_website_demo/models/phone/phone_model.dart';

class FirestoreService {
  String? uid;

  FirestoreService({this.uid});

  // Collection Reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference phoneCollection =
      FirebaseFirestore.instance.collection('phones');
  final CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('orders');
  final CollectionReference userCartCollection =
      FirebaseFirestore.instance.collection('userCart');
  final CollectionReference userOrderCollection =
      FirebaseFirestore.instance.collection('userOrders');

  get phoneList => phoneCollection.snapshots();

  // Future - Update Phone Data
  Future<void> addPhone({
    required String model,
    required int battery,
    required double screenSize,
    required String camera,
    required double sar,
    required int ram,
    required String storage,
    required double price,
    required int quantity,
    required String photoUrl,
    required String soc,
  }) async {
    return await phoneCollection.doc().set({
      'model': model,
      'battery': battery,
      'screenSize': screenSize,
      'camera': camera,
      'sar': sar,
      'ram': ram,
      'storage': storage,
      'price': price,
      'quantity': quantity,
      'photoUrl': photoUrl,
      'soc': soc,
    });
  }

  // Future - Update User Data
  Future<void> updateUserData(
    String email,
    String firstName,
    String lastName,
    String phoneNumber,
    String streetAddress,
    String city,
    String postalCode,
  ) async {
    return userCollection.doc(uid).set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'streetAddress': streetAddress,
      'city': city,
      'postalCode': postalCode,
    });
  }

  Stream<List<PhoneModel>> get phones => phoneCollection.snapshots().map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => PhoneModel(
                model: doc.get('model') as String,
                battery: doc.get('battery') as int,
                screenSize: doc.get('screenSize') as double,
                camera: doc.get('camera') as String,
                sar: doc.get('sar') as double,
                ram: doc.get('ram') as int,
                storage: doc.get('storage') as String,
                price: doc.get('price') as double,
                quantity: doc.get('quantity') as int,
                photoUrl: doc.get('photoUrl') as String,
                soc: doc.get('soc') as String,
              ),
            )
            .toList(),
      );

  // Stream - Get User Data
  Stream<QuerySnapshot<Object?>> get userData {
    return userCollection.snapshots();
  }

  // Stream - Get Phone Data
  Stream<QuerySnapshot<Object?>> get phoneStream {
    return phoneCollection.snapshots();
  }

  // Future<List<DocumentSnapshot>> get phones async {
  //   return phoneCollection.get().then((value) => value.docs);
  // }

  // phoneData from snapshot
  // PhoneModel _phoneDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return PhoneModel(
  //     uid: snapshot.id,
  //     model: snapshot.get('model'])
  //     photoUrl: snapshot.get('photoUrl') as String,
  //     soc: snapshot.get('soc'])
  //     ram: snapshot.get('ram'])
  //     storage: snapshot.get('storage'])
  //     screenSize: snapshot.get('screenSize'])
  //     battery: snapshot.get('battery'])
  //     camera: snapshot.get('camera'])
  //     price: snapshot.get('price'])
  //     quantity: snapshot.get('quantity'])
  //     sar: snapshot.get('sar'])
  //   );
  // }
}
