import 'package:flutter_ecommerce_website_demo/models/phone/phone_model.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/dialog_service.dart';
import '../../services/firestore_service.dart';
import '../../shared/validators.dart';

class AddPhoneViewModel extends BaseViewModel with Validators {
  final DialogService _dialogService = locator<DialogService>();

  Future addPhone({
    required model,
    required soc,
    required ram,
    required storage,
    required screenSize,
    required battery,
    required camera,
    required price,
    required stock,
    required imageUrl,
    required sar,
  }) async {
    if (validateBattery(battery) != null &&
        validatePrice(price) != null &&
        validateStock(stock) != null &&
        validateScreenSize(screenSize) != null &&
        validateStorage(storage) != null &&
        validateRam(ram) != null &&
        validateCamera(camera) != null &&
        validateSar(sar) != null &&
        validateSoc(soc) != null) {
      _dialogService.showDialog(
        title: 'Invalid Details',
        description:
            '${validateBattery(battery)} ${validatePrice(price)} ${validateStock(stock)} ${validateScreenSize(screenSize)} ${validateStorage(storage)} ${validateRam(ram)} ${validateCamera(camera)} ${validateSar(sar)} ${validateSoc(soc)}',
      );
    } else {
      setBusy(true);
      PhoneModel phoneModel = PhoneModel(
        model: model,
        soc: soc,
        ram: int.parse(ram),
        storage: storage,
        screenSize: double.parse(screenSize),
        battery: int.parse(battery),
        camera: camera,
        price: double.parse(price),
        stock: int.parse(stock),
        imageUrl: imageUrl,
        sar: double.parse(sar),
      );
      await locator<FirestoreService>().createPhone(phoneModel);
      setBusy(false);
      _dialogService.showDialog(
        title: 'Success',
        description: 'You have successfully added a new phone',
      );
    }
  }
}
