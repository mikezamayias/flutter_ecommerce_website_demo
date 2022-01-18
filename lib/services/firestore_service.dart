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
      'userOrders': null,
      'userCart': null,
      'dateCreated': DateTime.now(),
      'lastUpdated': DateTime.now(),
    });
  }

  // Stream - Get User Data
  Stream<QuerySnapshot<Object?>> get userData {
    return userCollection.snapshots();
  }

  // Stream - Get Phone Data
  Stream<QuerySnapshot<Object?>> get phoneStream {
    return phoneCollection.snapshots();
  }

  // phoneData from snapshot
  // PhoneModel _phoneDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return PhoneModel(
  //     uid: snapshot.id,
  //     model: snapshot.data['model'],
  //     photoUrl: snapshot.data['photoUrl'] as String,
  //     soc: snapshot.data['soc'],
  //     ram: snapshot.data['ram'],
  //     storage: snapshot.data['storage'],
  //     screenSize: snapshot.data['screenSize'],
  //     battery: snapshot.data['battery'],
  //     camera: snapshot.data['camera'],
  //     price: snapshot.data['price'],
  //     quantity: snapshot.data['quantity'],
  //     sar: snapshot.data['sar'],
  //   );
  // }
}
