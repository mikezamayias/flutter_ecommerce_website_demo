import 'package:flutter/material.dart';

import '../view_blueprint/view_blueprint.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ViewBlueprint(
      child: Center(
        child: Text('Cart View'),
      ),
    );
  }
}
