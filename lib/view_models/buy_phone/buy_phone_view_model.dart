import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_website_demo/models/user/user_model.dart';
import 'package:flutter_ecommerce_website_demo/services/authentication_service.dart';
import 'package:flutter_ecommerce_website_demo/services/firestore_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class BuyPhoneViewModel extends BaseViewModel {
  Future buyPhone() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
