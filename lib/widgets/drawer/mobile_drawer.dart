import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../models/user/user_model.dart';
import '../../services/authentication_service.dart';
import '../../services/firestore_service.dart';
import '../app_bar_actions/desktop_navigation/desktop_navigation_app_bar_actions.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? _user = locator<AuthenticationService>().currentUser;
    return Drawer(
      child: ListView(
        children: [
          _user == null
              ? const DrawerHeader(child: SizedBox())
              : StreamBuilder<UserModel?>(
                  stream: locator<FirestoreService>().streamUser(_user.uid),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<UserModel?> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      final _userModel = snapshot.data;
                      if (_userModel != null) {
                        return UserAccountsDrawerHeader(
                          accountName: Text(
                            '${_userModel.firstName} ${_userModel.lastName}',
                          ),
                          accountEmail: Text(_userModel.email),
                        );
                      } else {
                        return const DrawerHeader(
                          child: Text('Loading'),
                        );
                      }
                    } else if (snapshot.hasError) {
                      debugPrint(snapshot.error.toString());
                      return const Center(
                        child: Icon(
                          Icons.error_outline_rounded,
                          color: Colors.red,
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
          ...desktopNavigationAppBarActions(context).map((action) {
            return SizedBox(
              height: 60,
              child: action,
            );
          }).toList()
        ],
      ),
    );
  }
}
