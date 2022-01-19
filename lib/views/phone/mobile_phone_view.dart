import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../shared/ui/ui_helpers.dart';
import '../../view_models/phone/add_phone_view_model.dart';
import '../../widgets/busy_button.dart';
import '../../widgets/custom_text_form_field.dart';

class MobilePhoneView extends StatelessWidget {
  const MobilePhoneView({
    Key? key,
    required AddPhoneViewModel model,
    required TextEditingController modelTextEditingController,
    required TextEditingController socTextEditingController,
    required TextEditingController ramTextEditingController,
    required TextEditingController storageTextEditingController,
    required TextEditingController screenSizeTextEditingController,
    required TextEditingController batteryTextEditingController,
    required TextEditingController cammeraTextEditingController,
    required TextEditingController priceTextEditingController,
    required TextEditingController quantityTextEditingController,
    required TextEditingController photoUrlTextEditingController,
    required TextEditingController sarTextEditingController,
  })  : _model = model,
        _modelTextEditingController = modelTextEditingController,
        _socTextEditingController = socTextEditingController,
        _ramTextEditingController = ramTextEditingController,
        _storageTextEditingController = storageTextEditingController,
        _screenSizeTextEditingController = screenSizeTextEditingController,
        _batteryTextEditingController = batteryTextEditingController,
        _cammeraTextEditingController = cammeraTextEditingController,
        _priceTextEditingController = priceTextEditingController,
        _quantityTextEditingController = quantityTextEditingController,
        _photoUrlTextEditingController = photoUrlTextEditingController,
        _sarTextEditingController = sarTextEditingController,
        super(key: key);

  final AddPhoneViewModel _model;
  final TextEditingController _modelTextEditingController;
  final TextEditingController _socTextEditingController;
  final TextEditingController _ramTextEditingController;
  final TextEditingController _storageTextEditingController;
  final TextEditingController _screenSizeTextEditingController;
  final TextEditingController _batteryTextEditingController;
  final TextEditingController _cammeraTextEditingController;
  final TextEditingController _priceTextEditingController;
  final TextEditingController _quantityTextEditingController;
  final TextEditingController _photoUrlTextEditingController;
  final TextEditingController _sarTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceLarge,
        Text(
          'Add Phone',
          style: Theme.of(context).textTheme.headline3,
        ),
        verticalSpaceMedium,
        CustomTextFormField(
          labelText: 'Model',
          controller: _modelTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateModel,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'SoC',
          controller: _socTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateSoc,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'RAM',
          controller: _ramTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateRam,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Storage',
          controller: _storageTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateStorage,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Screen Size',
          controller: _screenSizeTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateScreenSize,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Battery',
          controller: _batteryTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateBattery,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Camera',
          controller: _cammeraTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateCamera,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Price',
          controller: _priceTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validatePrice,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Quantity',
          controller: _quantityTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateQuantity,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Photo Url',
          controller: _photoUrlTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validatePhotoUrl,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'SAR',
          controller: _sarTextEditingController,
          keyboardType: TextInputType.text,
          validator: _model.validateSar,
        ),
        verticalSpaceMedium,
        BusyButton(
          title: 'Add Phone',
          busy: _model.isBusy,
          onPressed: () {
            _model.addPhone(
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
            locator<NavigationService>().navigateTo(phoneRoute);
          },
        ),
        verticalSpaceLarge,
      ],
    );
  }
}
