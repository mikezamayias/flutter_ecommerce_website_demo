import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  String? uid;

  FirestoreService({this.uid});

  // Collection Reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference phonesCollection =
      FirebaseFirestore.instance.collection('phones');
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');
  final CollectionReference userCartCollection =
      FirebaseFirestore.instance.collection('userCart');
  final CollectionReference userOrdersCollection =
      FirebaseFirestore.instance.collection('userOrders');

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
  Stream<QuerySnapshot<Object?>> get phones {
    return phonesCollection.snapshots();
  }
}
