import 'package:flutter/material.dart';

class AddPhonePage extends StatelessWidget {
  const AddPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Add Phone Page',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}