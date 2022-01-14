import 'package:flutter/material.dart';

class CustomNavigationBarMobile extends StatelessWidget {
  const CustomNavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // drawer button
          TextButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            child: const Icon(Icons.menu),
          ),
          // logo
          const Text('Where Am I'),
        ],
      ),
    );
  }
}
