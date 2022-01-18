import 'package:stacked/stacked.dart';

import '../../models/phone/phone_model.dart';
import '../../services/firestore_service.dart';

class HomeViewModel extends BaseViewModel {
  final _phones = FirestoreService().phoneCollection;

  Stream<PhoneModel> get phones {
    return _phones.snapshots().map(_phoneDataFromSnapshot);
  }

  PhoneModel _phoneDataFromSnapshot(snapshot) {
    return PhoneModel(
      uid: snapshot.documentID,
      model: snapshot.data['model'],
      photoUrl: snapshot.data['photoUrl'],
      soc: snapshot.data['soc'],
      ram: snapshot.data['ram'],
      storage: snapshot.data['storage'],
      screenSize: snapshot.data['screenSize'],
      battery: snapshot.data['battery'],
      camera: snapshot.data['camera'],
      price: snapshot.data['price'],
      quantity: snapshot.data['quantity'],
      sar: snapshot.data['sar'],
    );
  }
}
