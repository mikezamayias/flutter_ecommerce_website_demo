import 'package:flutter_ecommerce_website_demo/models/phone/phone_model.dart';
import 'package:stacked/stacked.dart';

class PhonesPageViewModel extends BaseViewModel {
  List<PhoneModel> _phoneModels = [];

  List<PhoneModel> get phoneModels => _phoneModels;

  void setPhoneModels(List<PhoneModel> phoneModels) {
    _phoneModels = phoneModels;
  }
}
