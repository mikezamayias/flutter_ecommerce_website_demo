import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'locator.dart';
import 'pages/pages.dart';
import 'providers/page_key_provider.dart';
import 'providers/sizing_information_provider.dart';
import 'services/scaffold_service.dart';
import 'theme.dart';
import 'widgets/app_bar_actions/desktop_navigation/desktop_navigation_app_bar_actions.dart';
import 'widgets/app_bar_actions/mobile_navigation/mobile_navigation_app_bar_actions.dart';
import 'widgets/drawer/mobile_drawer.dart';

class FlutterEcommerceWebsiteDemo extends StatefulWidget {
  const FlutterEcommerceWebsiteDemo({Key? key}) : super(key: key);

  @override
  _FlutterEcommerceWebsiteDemoState createState() =>
      _FlutterEcommerceWebsiteDemoState();
}

class _FlutterEcommerceWebsiteDemoState
    extends State<FlutterEcommerceWebsiteDemo> {
  changePage(String key) {
    setState(() {
      context.watch<PageKeyProvider>().key = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Flutter Ecommerce Website Demo',
      debugShowCheckedModeBanner: false,
      home: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          Provider.of<SizingInformationProvider>(context, listen: false)
              .sizingInformation = sizingInformation;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            key: locator<ScaffoldService>().scaffoldKey,
            endDrawer: context
                    .watch<SizingInformationProvider>()
                    .sizingInformation
                    .isDesktop
                ? null
                : const MobileDrawer(),
            appBar: AppBar(
              leadingWidth: 120,
              leading: Padding(
                padding: const EdgeInsets.all(6.9),
                child: TextButton(
                  onPressed: () =>
                      Provider.of<PageKeyProvider>(context, listen: false).key =
                          '/',
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              centerTitle: false,
              elevation: 6,
              backgroundColor: Colors.white,
              shadowColor: Colors.orange,
              actions: sizingInformation.isDesktop
                  ? desktopNavigationAppBarActions(context)
                  : mobileNavigationAppBarActions(context),
            ),
            body: pages[context.watch<PageKeyProvider>().key]!,
          );
        },
      ),
    );
  }
}
