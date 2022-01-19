import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../services/form_service.dart';
import '../../view_models/phone/add_phone_view_model.dart';
import 'components/desktop_add_phone_view.dart';
import 'components/mobile_add_phone_view.dart';

class AddPhoneView extends StatefulWidget {
  const AddPhoneView({Key? key}) : super(key: key);

  @override
  _AddPhoneViewState createState() => _AddPhoneViewState();
}

class _AddPhoneViewState extends State<AddPhoneView> {
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
      builder: (context, _model, child) {
        return Form(
          key: locator<FormService>().phoneFormKey,
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 30),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 60)
                    : const EdgeInsets.only(),
                child: SingleChildScrollView(
                  child: sizingInformation.isDesktop
                      ? DesktopAddPhoneView(
                          modelTextEditingController:
                              _modelTextEditingController,
                          socTextEditingController: _socTextEditingController,
                          ramTextEditingController: _ramTextEditingController,
                          storageTextEditingController:
                              _storageTextEditingController,
                          screenSizeTextEditingController:
                              _screenSizeTextEditingController,
                          batteryTextEditingController:
                              _batteryTextEditingController,
                          cammeraTextEditingController:
                              _cammeraTextEditingController,
                          priceTextEditingController:
                              _priceTextEditingController,
                          quantityTextEditingController:
                              _quantityTextEditingController,
                          photoUrlTextEditingController:
                              _photoUrlTextEditingController,
                          sarTextEditingController: _sarTextEditingController,
                          model: _model,
                        )
                      : MobileAddPhoneView(
                          modelTextEditingController:
                              _modelTextEditingController,
                          socTextEditingController: _socTextEditingController,
                          ramTextEditingController: _ramTextEditingController,
                          storageTextEditingController:
                              _storageTextEditingController,
                          screenSizeTextEditingController:
                              _screenSizeTextEditingController,
                          batteryTextEditingController:
                              _batteryTextEditingController,
                          cammeraTextEditingController:
                              _cammeraTextEditingController,
                          priceTextEditingController:
                              _priceTextEditingController,
                          quantityTextEditingController:
                              _quantityTextEditingController,
                          photoUrlTextEditingController:
                              _photoUrlTextEditingController,
                          sarTextEditingController: _sarTextEditingController,
                          model: _model,
                        ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
