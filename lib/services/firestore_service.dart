import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/phone/phone_model.dart';
import '../models/user/user_model.dart';

class FirestoreService {
  /// Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get fireStore => _firestore;

  /// User Collection Reference
  CollectionReference<Map<String, dynamic>> get userCollection =>
      _firestore.collection('users');

  /// Phone Collection Reference
  CollectionReference<Map<String, dynamic>> get phoneCollection =>
      _firestore.collection('phones');

  /// Cart Collection Reference
  CollectionReference<Map<String, dynamic>> get cartCollection =>
      _firestore.collection('cart');

  /// Order Collection Reference
  CollectionReference<Map<String, dynamic>> get ordersCollection =>
      _firestore.collection('orders');

  /// User Snapshot Stream
  Stream<QuerySnapshot<Object?>> get userSnapshot => userCollection.snapshots();

  /// Phone Snapshot Stream
  Stream<QuerySnapshot<Object?>> get phoneStream => phoneCollection.snapshots();

  /// Cart Snapshot Stream
  Stream<QuerySnapshot<Object?>> get cartStream => cartCollection.snapshots();

  /// Order Snapshot Stream
  Stream<QuerySnapshot<Object?>> get orderStream =>
      ordersCollection.snapshots();

  // Create Phone
  Future<void> createPhone(PhoneModel phoneModel) async {
    return await phoneCollection.doc().set(phoneModel.toMap());
  }

  // Create User
  Future<void> createUser(UserModel userModel) async {
    return userCollection.doc(userModel.uid).set(userModel.toMap());
  }

  // Read Users
  Stream<List<UserModel>> get readAllUsers => userCollection.snapshots().map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => UserModel(
                uid: doc.get('uid') as String,
                email: doc.get('email') as String,
                firstName: doc.get('firstName') as String,
                lastName: doc.get('lastName') as String,
                phoneNumber: doc.get('phoneNumber') as String,
                streetAddress: doc.get('streetAddress') as String,
                city: doc.get('city') as String,
                postalCode: doc.get('postalCode') as int,
              ),
            )
            .toList(),
      );

  // Read User with specified uid
  Stream<UserModel> readUser(String uid) =>
      userCollection.doc(uid).get().asStream().map(
        (snapshot) => UserModel(
          uid: snapshot.get('uid') as String,
          email: snapshot.get('email') as String,
          firstName: snapshot.get('firstName') as String,
          lastName: snapshot.get('lastName') as String,
          phoneNumber: snapshot.get('phoneNumber') as String,
          streetAddress: snapshot.get('streetAddress') as String,
          city: snapshot.get('city') as String,
          postalCode: snapshot.get('postalCode') as int,
        ),
      );

  // Read Phone Catalog
  Stream<List<PhoneModel>> get readPhones => phoneCollection.snapshots().map(
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
                stock: doc.get('quantity') as int,
                photoUrl: doc.get('photoUrl') as String,
                soc: doc.get('soc') as String,
              ),
            )
            .toList(),
      );
}
