import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'locator.dart';
import 'routing/router.dart';
import 'services/navigation_service.dart';
import 'widgets/navigation/navigation_actions.dart';
import 'widgets/navigation/navigation_bar_logo.dart';

class EcommerceWebsite extends StatefulWidget {
  const EcommerceWebsite({Key? key}) : super(key: key);

  @override
  _EcommerceWebsiteState createState() => _EcommerceWebsiteState();
}

class _EcommerceWebsiteState extends State<EcommerceWebsite> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.firaSans().fontFamily,
        primarySwatch: Colors.orange,
      ),
      home: ColorfulSafeArea(
        color: Colors.orange,
        child: ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
            return Scaffold(
              key: scaffoldKey,
              endDrawer: sizingInformation.isDesktop
                  ? null
                  : SizedBox(
                      width: 240,
                      child: Drawer(
                        backgroundColor: Colors.grey[100],
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(9),
                            children: navigationActions
                                .map(
                                  (action) => Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(9),
                                      child: action,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const NavigationBarLogo(),
                centerTitle: false,
                actions: sizingInformation.isDesktop
                    ? navigationActions
                        .map(
                          (action) => Padding(
                            padding: const EdgeInsets.only(
                              right: 15,
                              top: 6,
                              bottom: 6,
                            ),
                            child: action,
                          ),
                        )
                        .toList()
                    : [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                            top: 6,
                            bottom: 6,
                          ),
                          child: TextButton.icon(
                            onPressed: () =>
                                scaffoldKey.currentState?.openEndDrawer(),
                            icon: const Icon(Icons.menu_rounded),
                            label: const Text('Menu'),
                          ),
                        ),
                      ],
              ),
              body: Navigator(
                key: locator<NavigationService>().navigationKey,
                onGenerateRoute: generateRoute,
                initialRoute: 'home',
              ),
            );
          },
        ),
      ),
    );
  }
}
