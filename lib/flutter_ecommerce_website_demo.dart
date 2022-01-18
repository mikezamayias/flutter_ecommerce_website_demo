import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'locator.dart';
import 'routing/router.dart';
import 'routing/routes.dart';
import 'services/authentication_service.dart';
import 'services/dialog_service.dart';
import 'services/firestore_service.dart';
import 'services/navigation_service.dart';
import 'services/scaffold_service.dart';
import 'shared/ui/shared_styles.dart';
import 'themes/custom_theme_data.dart';
import 'views/dialog_manager.dart';
import 'widgets/navigation/custom_navigation_drawer.dart';
import 'widgets/navigation/desktop_navigation_bar.dart';
import 'widgets/navigation/mobile_navigation_bar.dart';

class FlutterEcommerceWebsiteDemo extends StatefulWidget {
  const FlutterEcommerceWebsiteDemo({Key? key}) : super(key: key);

  @override
  _FlutterEcommerceWebsiteDemoState createState() =>
      _FlutterEcommerceWebsiteDemoState();
}

class _FlutterEcommerceWebsiteDemoState
    extends State<FlutterEcommerceWebsiteDemo> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: locator<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        StreamProvider<QuerySnapshot?>.value(
          value: FirestoreService().phones,
          initialData: null,
        ),
        StreamProvider<QuerySnapshot?>.value(
          value: FirestoreService().userData,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter E-Commerce Website Demo',
        debugShowCheckedModeBanner: false,
        theme: CurrentTheme.lightTheme,
        darkTheme: CurrentTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: HomeViewRoute,
        builder: (context, child) => Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            // builder: (context) => DialogManager(child: child!),
            builder: (context) => ResponsiveBuilder(
              builder: (context, sizingInformation) {
                return DialogManager(
                  child: ColorfulSafeArea(
                    color: Colors.orange,
                    child: Scaffold(
                      key: locator<ScaffoldService>().scaffoldKey,
                      endDrawer: sizingInformation.isDesktop
                          ? null
                          : const CustomNavigationDrawer(),
                      backgroundColor: backgroundColor,
                      body: CustomScrollView(
                        slivers: <Widget>[
                          sizingInformation.isDesktop
                              ? const DesktopNavigationBar()
                              : const MobileNavigationBar(),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: sizingInformation.screenSize.height,
                              child: Container(
                                padding: sizingInformation.isDesktop
                                    ? const EdgeInsets.symmetric(horizontal: 90)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 24),
                                alignment: Alignment.topCenter,
                                child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 1200),
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(
                                      scrollbars: false,
                                      overscroll: false,
                                    ),
                                    child: DialogManager(
                                      child: child!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
