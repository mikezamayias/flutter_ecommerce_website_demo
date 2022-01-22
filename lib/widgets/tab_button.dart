import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  final int index;
  final int currentIndex;
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;

  const TabButton({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.title,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  _TabButtonState createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.9),
      child: TextButton.icon(
        onPressed: widget.onPressed,
        label: Text(
          widget.title,
          style: TextStyle(
            color: widget.currentIndex == widget.index
                ? Colors.white
                : Colors.orange,
          ),
        ),
        icon: Icon(
          widget.iconData,
          color: widget.currentIndex == widget.index
              ? Colors.white
              : Colors.orange,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            widget.currentIndex == widget.index ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
