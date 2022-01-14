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
    return SizedBox(
      width: 600,
      height: 300,
      child: Card(
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        // child: GridView.count(
        //   scrollDirection: Axis.horizontal,
        //   crossAxisCount: 3,
        //   children: specs,
        // ),
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: specs.length,
          ),
          itemCount: specs.length,
          itemBuilder: (context, index) => specs[index],
        ),
      ),
    );
  }
}