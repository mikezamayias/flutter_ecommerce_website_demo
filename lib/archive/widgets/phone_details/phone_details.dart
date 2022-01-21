import 'package:flutter/material.dart';

class PhoneDetails extends StatelessWidget {
  const PhoneDetails({Key? key}) : super(key: key);

  final List<StatelessWidget> specs = const [
    // model
    ListTile(
      title: Text('Model'),
      subtitle: Text('iPhone 13 Pro'),
    ),
    // price
    ListTile(
      title: Text('Price'),
      subtitle: Text('\$1,000'),
    ),
    //  quantity
    ListTile(
      title: Text('Quantity'),
      subtitle: Text('1'),
    ),
    //  screen size
    ListTile(
      title: Text('Screen size'),
      subtitle: Text('5.8'),
    ),
    //  cpu
    ListTile(
      title: Text('CPU'),
      subtitle: Text('Apple A15 Bionic'),
    ),
    //  ram
    ListTile(
      title: Text('RAM'),
      subtitle: Text('6 GB'),
    ),
    // camera
    ListTile(
      title: Text('Camera'),
      subtitle: Text('12 MP'),
    ),
    // battery
    ListTile(
      title: Text('Battery'),
      subtitle: Text('3095 mAh'),
    ),
    // sar
    ListTile(
      title: Text('SAR'),
      subtitle: Text('0.99 W/kg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink(
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
          side: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 3,
          ),
        ),
        child: Wrap(
          direction: Axis.vertical,
          children: specs,
        ),
      ),
    );
  }
}
