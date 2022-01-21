import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/services/authentication_service.dart';
import 'package:provider/provider.dart';

import '../../extensions/hover_extension.dart';
import '../../extensions/padding_extension.dart';
import '../../locator.dart';
import '../../models/user/user_model.dart';
import '../../shared/ui/shared_styles.dart';
import '../../shared/ui/ui_helpers.dart';
import '../navigation_items/add_phone_navigation_item.dart';
import '../navigation_items/cart_navigation_item.dart';
import '../navigation_items/contact_navigation_item.dart';
import '../navigation_items/log_in_navigation_item.dart';
import '../navigation_items/log_out_navigation_item.dart';
import '../navigation_items/orders_navigation_item.dart';
import '../navigation_items/shop_navigation_item.dart';
import '../navigation_items/sign_up_navigation_item.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    bool loggedIn = user != null;
    return StreamBuilder<UserModel?>(
      stream: locator<AuthenticationService>().userModel,
      builder: (context, snapshot) {
        var userModel = snapshot.data;
        return SizedBox(
          width: 240,
          child: Drawer(
            backgroundColor: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: ListView(
                children: loggedIn
                    ? [
                        DrawerHeader(
                            child: Text(
                          'Hello,\n${userModel?.firstName ?? user.uid}',
                          style: Theme.of(context).textTheme.headline6,
                        )),
                        verticalSpaceSmall,
                        const AddPhoneNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const ShopNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const CartNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const OrdersNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const ContactNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const LogOutNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                      ]
                    : [
                        const DrawerHeader(
                          child: SizedBox.shrink(),
                        ),
                        verticalSpaceSmall,
                        const SignUpNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const LogInNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const ShopNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const CartNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                        verticalSpaceSmall,
                        const ContactNavigationItem()
                            .paddNavigationDrawerItem
                            .moveUpOnHover,
                      ],
              ),
            ),
          ),
        );
      },
    );
  }
}
