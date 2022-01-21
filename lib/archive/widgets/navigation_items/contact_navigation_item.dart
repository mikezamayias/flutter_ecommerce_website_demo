import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../routing/routes.dart';
import '../../services/navigation_service.dart';
import 'navigation_item.dart';

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
    return NavigationItem(
      label: 'Contact Us',
      icon: const Icon(Icons.contact_page_rounded),
      onPressed: () =>
          locator<NavigationService>().navigateTo(contactRoute),
    );
  }
}
