import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import '../../locator.dart';

class ContactNavigationItem extends StatefulWidget {
  const ContactNavigationItem({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactNavigationItem> createState() => _ContactNavigationItemState();
}

class _ContactNavigationItemState extends State<ContactNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        locator<NavigationService>().navigateTo(ContactViewRoute);
      },
      icon: const Icon(Icons.contact_page_rounded),
      label: const Text('Contact'),
    );
  }
}
