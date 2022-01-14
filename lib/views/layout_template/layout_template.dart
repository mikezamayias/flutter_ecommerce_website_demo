import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../centered_view/centered_view.dart';
import '../../widgets/footer/footer.dart';
import '../../widgets/navigation/custom_navigation_bar.dart';
import '../../widgets/navigation/mobile/custom_navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<PhoneDetails> phones = List.generate(
    //   30,
    //   (index) => const PhoneDetails(),
    // );
    return SafeArea(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: [DeviceScreenType.mobile, DeviceScreenType.tablet]
                  .contains(sizingInformation.deviceScreenType)
              ? const CustomNavigationDrawer()
              : null,
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: CenteredView(
              child: Column(
                children: const [
                  CustomNavigationBar(),
                  Expanded(child: Navigator()),
                  // const Text(
                  //   'Shop Phones',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // const SizedBox(height: 15),
                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: phones.length,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: [
                  //       DeviceScreenType.mobile,
                  //       DeviceScreenType.tablet
                  //     ].contains(sizingInformation.deviceScreenType)
                  //         ? 1
                  //         : 4,
                  //     childAspectRatio: [
                  //       DeviceScreenType.mobile,
                  //       DeviceScreenType.tablet
                  //     ].contains(sizingInformation.deviceScreenType)
                  //         ? 2
                  //         : 4 / 7,
                  //     crossAxisSpacing: 30,
                  //     mainAxisSpacing: 30,
                  //   ),
                  //   itemBuilder: (context, index) => const Placeholder(),
                  // ),
                  Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
