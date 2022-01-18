import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_website_demo/models/user/user_model.dart';

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
  Future<void> updateUserData(UserModel userModel) {
    return userCollection.doc(uid).set(userModel.toJson());
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
