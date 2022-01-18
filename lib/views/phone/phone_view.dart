import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/models/phone/phone_model.dart';
import 'package:flutter_ecommerce_website_demo/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../shared/ui/ui_helpers.dart';
import '../../view_models/phone/add_phone_view_model.dart';
import '../../widgets/busy_button.dart';
import '../../widgets/custom_text_form_field.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({Key? key}) : super(key: key);

  @override
  _PhoneViewState createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  final _modelTextEditingController = TextEditingController();
  final _priceTextEditingController = TextEditingController();
  final _socTextEditingController = TextEditingController();
  final _ramTextEditingController = TextEditingController();
  final _cammeraTextEditingController = TextEditingController();
  final _batteryTextEditingController = TextEditingController();
  final _photoUrlTextEditingController = TextEditingController();
  final _storageTextEditingController = TextEditingController();
  final _screenSizeTextEditingController = TextEditingController();
  final _quantityTextEditingController = TextEditingController();
  final _sarTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPhoneViewModel>.reactive(
      viewModelBuilder: () => AddPhoneViewModel(),
      builder: (context, model, child) => Form(
        key: locator<FormService>().addPhoneFormKey,
        child: StreamBuilder(
          stream: FirestoreService().phoneStream,
          builder: (context, snapshot) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                verticalSpaceLarge,
                Text(
                  'Register Phone',
                  style: Theme.of(context).textTheme.headline3,
                ),
                verticalSpaceMedium,
                CustomTextFormField(
                  labelText: 'Model',
                  controller: _modelTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateModel,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'SoC',
                  controller: _socTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateSoc,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'RAM',
                  controller: _ramTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateRam,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'Storage',
                  controller: _storageTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateStorage,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'Screen Size',
                  controller: _screenSizeTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateScreenSize,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'Battery',
                  controller: _batteryTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateBattery,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'Camera',
                  controller: _cammeraTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateCamera,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'Price',
                  controller: _priceTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validatePrice,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'Quantity',
                  controller: _quantityTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateQuantity,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'Photo Url',
                  controller: _photoUrlTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validatePhotoUrl,
                ),
                verticalSpaceSmall,
                CustomTextFormField(
                  labelText: 'SAR',
                  controller: _sarTextEditingController,
                  keyboardType: TextInputType.text,
                  validator: model.validateSar,
                ),
                verticalSpaceMedium,
                BusyButton(
                  title: 'Add Phone',
                  busy: model.isBusy,
                  onPressed: () {
                    model.addPhone(
                      model: _modelTextEditingController.text,
                      soc: _socTextEditingController.text,
                      ram: _ramTextEditingController.text,
                      storage: _storageTextEditingController.text,
                      screenSize: _screenSizeTextEditingController.text,
                      battery: _batteryTextEditingController.text,
                      camera: _cammeraTextEditingController.text,
                      price: _priceTextEditingController.text,
                      quantity: _quantityTextEditingController.text,
                      photoUrl: _photoUrlTextEditingController.text,
                      sar: _sarTextEditingController.text,
                    );
                  },
                ),
                verticalSpaceLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
