import 'package:flutter/material.dart';

import '../view_blueprint/view_blueprint.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ViewBlueprint(
      child: Center(
        child: Text('Orders View'),
      ),
    );
  }
}
