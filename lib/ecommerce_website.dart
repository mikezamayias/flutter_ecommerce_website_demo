import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'locator.dart';
import 'routing/router.dart';
import 'routing/routes.dart';
import 'services/authentication_service.dart';
import 'services/navigation_service.dart';
import 'services/scaffold_key_service.dart';
import 'widgets/navigation/custom_navigation_drawer.dart';
import 'widgets/navigation/desktop_navigation_bar.dart';
import 'widgets/navigation/mobile_navigation_bar.dart';

class EcommerceWebsite extends StatefulWidget {
  const EcommerceWebsite({Key? key}) : super(key: key);

  @override
  _EcommerceWebsiteState createState() => _EcommerceWebsiteState();
}

class _EcommerceWebsiteState extends State<EcommerceWebsite> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
          value: locator<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
          title: 'E-commerce Website',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: GoogleFonts.firaSans().fontFamily,
            primarySwatch: Colors.orange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                GoogleFonts.firaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ),
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute: HomeViewRoute,
          builder: (context, child) {
            return ResponsiveBuilder(builder:
                (BuildContext context, SizingInformation sizingInformation) {
              return ColorfulSafeArea(
                color: Colors.orange,
                child: Scaffold(
                  key: locator<ScaffoldKeyService>().scaffoldKey,
                  endDrawer: sizingInformation.isDesktop
                      ? null
                      : const CustomNavigationDrawer(),
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
                                : const EdgeInsets.symmetric(horizontal: 24),
                            alignment: Alignment.topCenter,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 1200),
                              child: ScrollConfiguration(
                                behavior:
                                    ScrollConfiguration.of(context).copyWith(
                                  scrollbars: false,
                                  overscroll: false,
                                ),
                                child: child!,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
    );
  }
}