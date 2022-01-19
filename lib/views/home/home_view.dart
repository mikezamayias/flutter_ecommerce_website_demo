import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../models/phone/phone_model.dart';
import '../../services/firestore_service.dart';
import 'phone_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final phones = Provider.of<List<PhoneModel>>(context);
    return StreamBuilder<List<PhoneModel>>(
      stream: FirestoreService().phones,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
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
                    children:
                        phones.map((phone) => PhoneCard(phone: phone)).toList(),
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
