import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';
import '../../routing/router.dart';
import '../../services/navigation_service.dart';
import '../../widgets/footer/footer.dart';
import '../../widgets/navigation/custom_navigation_bar.dart';
import '../../widgets/navigation/mobile/custom_navigation_drawer.dart';
import '../centered_view/centered_view.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        endDrawer: sizingInformation.isMobile || sizingInformation.isTablet
            ? const CustomNavigationDrawer()
            : null,
        backgroundColor: Colors.grey[100],
        body: CenteredView(
          child: Column(
            children: <Widget>[
              const CustomNavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigationKey,
                  onGenerateRoute: generateRoute,
                  initialRoute: 'home',
                ),
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
