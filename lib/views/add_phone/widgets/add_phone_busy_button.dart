import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../routing/routes.dart';
import '../../../services/navigation_service.dart';
import '../../../view_models/phone/add_phone_view_model.dart';
import '../../../widgets/busy_button.dart';

class AddPhoneBusyButton extends StatelessWidget {
  const AddPhoneBusyButton({
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
            locator<NavigationService>().navigateTo(addPhoneRoute);
          },
        ),
      ],
    );
  }
}
