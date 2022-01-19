import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/views/phone/desktop_phone_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/form_service.dart';
import '../../services/navigation_service.dart';
import '../../shared/ui/ui_helpers.dart';
import '../../view_models/phone/add_phone_view_model.dart';
import '../../widgets/busy_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'mobile_phone_view.dart';

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
      builder: (context, _model, child) {
        return Form(
          key: locator<FormService>().addPhoneFormKey,
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 30),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 60)
                    : const EdgeInsets.only(),
                child: SingleChildScrollView(
                  child: sizingInformation.isDesktop
                      ? DesktopPhoneView(
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
                      : MobilePhoneView(
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
