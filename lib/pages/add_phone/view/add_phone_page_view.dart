import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/pages/add_phone/view_model/add_phone_page_view_model.dart';
import 'package:flutter_ecommerce_website_demo/services/form_service.dart';
import 'package:flutter_ecommerce_website_demo/widgets/busy_button.dart';
import 'package:flutter_ecommerce_website_demo/widgets/text_input/orange_text_form_field.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';

class AddPhonePageView extends StatelessWidget {
  const AddPhonePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPhonePageViewModel>.reactive(
      viewModelBuilder: () => AddPhonePageViewModel(),
      builder: (
        BuildContext context,
        AddPhonePageViewModel model,
        Widget? child,
      ) {
        final _modelController = TextEditingController();
        final _imageUrlController = TextEditingController();
        final _socController = TextEditingController();
        final _ramController = TextEditingController();
        final _storageController = TextEditingController();
        final _screenSizeController = TextEditingController();
        final _batteryController = TextEditingController();
        final _cameraController = TextEditingController();
        final _priceController = TextEditingController();
        final _stockController = TextEditingController();
        final _sarContrller = TextEditingController();

        final _modelInputfield = OrangeTextFormField(
          controller: _modelController,
          labelText: 'Model',
          validator: model.validateModel,
          keyboardType: TextInputType.text,
        );
        final _imageUrlInputfield = OrangeTextFormField(
          controller: _imageUrlController,
          labelText: 'Image Url',
          validator: model.validateImageUrl,
          keyboardType: TextInputType.url,
        );
        final _socInputfield = OrangeTextFormField(
          controller: _socController,
          labelText: 'Soc',
          validator: model.validateSoc,
          keyboardType: TextInputType.text,
        );
        final _ramInputfield = OrangeTextFormField(
          controller: _ramController,
          labelText: 'Ram',
          validator: model.validateRam,
          keyboardType: TextInputType.number,
        );
        final _storageInputfield = OrangeTextFormField(
          controller: _storageController,
          labelText: 'Storage',
          validator: model.validateStorage,
          keyboardType: TextInputType.text,
        );
        final _screenSizeInputfield = OrangeTextFormField(
          controller: _screenSizeController,
          labelText: 'Screen Size',
          validator: model.validateScreenSize,
          keyboardType: TextInputType.number,
        );
        final _batteryInputfield = OrangeTextFormField(
          controller: _batteryController,
          labelText: 'Battery',
          validator: model.validateBattery,
          keyboardType: TextInputType.number,
        );
        final _cameraInputfield = OrangeTextFormField(
          controller: _cameraController,
          labelText: 'Camera',
          validator: model.validateCamera,
          keyboardType: TextInputType.text,
        );
        final _priceInputfield = OrangeTextFormField(
          controller: _priceController,
          labelText: 'Price',
          validator: model.validatePrice,
          keyboardType: TextInputType.number,
        );
        final _stockInputfield = OrangeTextFormField(
          controller: _stockController,
          labelText: 'Stock',
          validator: model.validateStock,
          keyboardType: TextInputType.number,
        );
        final _sarInputfield = OrangeTextFormField(
          controller: _sarContrller,
          labelText: 'Sar',
          validator: model.validateSar,
          keyboardType: TextInputType.number,
        );

        final _addPhoneformFields = [
          _modelInputfield,
          _imageUrlInputfield,
          _socInputfield,
          _ramInputfield,
          _storageInputfield,
          _screenSizeInputfield,
          _batteryInputfield,
          _cameraInputfield,
          _priceInputfield,
          _stockInputfield,
          _sarInputfield,
        ];

        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                constraints: sizingInformation.isDesktop
                    ? const BoxConstraints(maxWidth: 1200)
                    : BoxConstraints(
                        maxWidth: sizingInformation.screenSize.width,
                      ),
                duration: const Duration(milliseconds: 60),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: locator<FormService>().addPhoneFormKey(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Phone',
                        style: Theme.of(context).textTheme.headline2,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      if (!sizingInformation.isMobile)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _addPhoneformFields.sublist(0, 6).map(
                                  (item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: item,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _addPhoneformFields.sublist(6).map(
                                  (item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: item,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        )
                      else
                        ..._addPhoneformFields,
                      BusyButton(
                        title: 'Add Phone',
                        busy: model.isBusy,
                        onPressed: () {
                          model.addPhone(
                            context: context,
                            model: _modelController.text,
                            imageUrl: _imageUrlController.text,
                            soc: _socController.text,
                            ram: _ramController.text,
                            storage: _storageController.text,
                            screenSize: _screenSizeController.text,
                            battery: _batteryController.text,
                            camera: _cameraController.text,
                            price: _priceController.text,
                            stock: _stockController.text,
                            sar: _sarContrller.text,
                          );
                        },
                      ),
                    ].map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          child: item,
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
