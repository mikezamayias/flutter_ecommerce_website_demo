import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/providers/sizing_information_provider.dart';
import 'package:flutter_ecommerce_website_demo/services/authentication_service.dart';
import 'package:flutter_ecommerce_website_demo/widgets/busy_button.dart';
import 'package:provider/provider.dart';

import '../../../../locator.dart';
import '../../../../models/phone/phone_model.dart';
import 'specification_field.dart';

class PhoneSpecificationsCard extends StatelessWidget {
  const PhoneSpecificationsCard({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final PhoneModel phone;

  @override
  Widget build(BuildContext context) {
    if (context
        .watch<SizingInformationProvider>()
        .sizingInformation
        .isDesktop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl: phone.imageUrl,
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.red.shade700,
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) {
                          return CircularProgressIndicator(
                            value: downloadProgress.progress,
                          );
                        },
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // model
                          SpecificationField(
                            fieldName: 'Model',
                            fieldValue: phone.model,
                          ),
                          // soc
                          SpecificationField(
                            fieldName: 'Soc',
                            fieldValue: phone.soc,
                          ),
                          // ram
                          SpecificationField(
                            fieldName: 'Ram',
                            fieldValue: '${phone.ram} GB',
                          ),
                          // storage
                          SpecificationField(
                            fieldName: 'Storage',
                            fieldValue: phone.storage,
                          ),
                          // screen size
                          SpecificationField(
                            fieldName: 'Screen size',
                            fieldValue: '${phone.screenSize} inch',
                          ),
                          // camera
                          SpecificationField(
                            fieldName: 'Camera',
                            fieldValue: phone.camera,
                          ),
                          // sar
                          SpecificationField(
                            fieldName: 'SAR',
                            fieldValue: '${phone.sar} W/kg',
                          ),
                          // price
                          SpecificationField(
                            fieldName: 'Price',
                            fieldValue: '€${phone.price}',
                          ),
                          // quantity
                          SpecificationField(
                            fieldName: 'Stock',
                            fieldValue: '${phone.stock}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                BuyPhoneBusyButton(phone: phone),
              ].map(
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
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl: phone.imageUrl,
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.red.shade700,
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return CircularProgressIndicator(
                        value: downloadProgress.progress,
                      );
                    },
                    fit: BoxFit.contain,
                  ),
                ),
                // model
                SpecificationField(
                  fieldName: 'Model',
                  fieldValue: phone.model,
                ),
                // soc
                SpecificationField(
                  fieldName: 'Soc',
                  fieldValue: phone.soc,
                ),
                // ram
                SpecificationField(
                  fieldName: 'Ram',
                  fieldValue: '${phone.ram} GB',
                ),
                // storage
                SpecificationField(
                  fieldName: 'Storage',
                  fieldValue: phone.storage,
                ),
                // screen size
                SpecificationField(
                  fieldName: 'Screen size',
                  fieldValue: '${phone.screenSize} inch',
                ),
                // camera
                SpecificationField(
                  fieldName: 'Camera',
                  fieldValue: phone.camera,
                ),
                // sar
                SpecificationField(
                  fieldName: 'SAR',
                  fieldValue: '${phone.sar} W/kg',
                ),
                // price
                SpecificationField(
                  fieldName: 'Price',
                  fieldValue: '€${phone.price}',
                ),
                // quantity
                SpecificationField(
                  fieldName: 'Stock',
                  fieldValue: '${phone.stock}',
                ),
                BuyPhoneBusyButton(phone: phone),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class BuyPhoneBusyButton extends StatelessWidget {
  const BuyPhoneBusyButton({
    Key? key,
    required this.phone,
  }) : super(key: key);

  final PhoneModel phone;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BusyButton(
        title: 'Buy',
        onPressed: () {
          if (phone.stock > 0) {
            if (locator<AuthenticationService>().currentUser != null) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('${phone.model} added to cart'),
                    content: const Text('This feature is coming soon'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('You need to be logged in'),
                    content: const Text('This feature is coming soon'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('${phone.model} is out of stock'),
                  content: const Text('This feature is coming soon'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
