import 'package:flutter/material.dart';


class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cart View'),
    );
  }
}
