import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../models/phone/phone_model.dart';
import '../../shared/ui/ui_helpers.dart';
import '../../view_models/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final phones = Provider.of<List<PhoneModel>>(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.phones,
      builder: (context, model, child) {
        if (model.isBusy) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: phones.length,
            itemBuilder: (context, index) {
              final phone = phones[index];
              return Card(
                elevation: 9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      horizontalSpaceMedium,
                      CachedNetworkImage(
                        imageUrl: phone.photoUrl!,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.red.shade700,
                        ),
                        fit: BoxFit.contain,
                      ),
                      horizontalSpaceSmall,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // model
                          Text(
                            'Model: ${phone.model!}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // soc
                          Text(
                            'SoC: ${phone.soc!}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // ram
                          Text(
                            'RAM: ${phone.ram}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // storage
                          Text(
                            'Storage: ${phone.storage}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // screen size
                          Text(
                            'Screen Size: ${phone.screenSize}"',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // camera
                          Text(
                            'Camera: ${phone.camera}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // sar
                          Text(
                            'SAR: ${phone.sar} W/kg',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // price
                          Text(
                            'Price: €${phone.price}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          // quantity
                        ],
                      ),
                      horizontalSpaceMedium,
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
