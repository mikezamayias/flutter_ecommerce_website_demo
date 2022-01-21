import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';
import '../../models/phone/phone_model.dart';
import '../../services/firestore_service.dart';
import '../../shared/ui/ui_helpers.dart';
import 'widgets/phone_card.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PhoneModel?>?>(
      stream: locator<FirestoreService>().readPhones,
      builder: (context, snapshot) {
        debugPrint('List<PhoneModel>: ${snapshot.data}');
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 30),
                padding: sizingInformation.isDesktop
                    ? const EdgeInsets.symmetric(horizontal: 60)
                    : const EdgeInsets.only(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return PhoneCard(phone: snapshot.data![index]!);
                        },
                      ),
                      verticalSpaceMassive,
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
