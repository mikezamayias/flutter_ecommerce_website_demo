import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/extensions/hover_extension.dart';

import '../ui/shared/shared_styles.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;
  const BusyButton({
    Key? key,
    this.busy = false,
    required this.title,
    required this.onPressed,
    this.enabled = true,
  }) : super(key: key);

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        child: AnimatedContainer(
          height: widget.busy ? 40 : null,
          width: widget.busy ? 40 : null,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: widget.busy ? 10 : 15,
            vertical: widget.busy ? 10 : 10,
          ),
          decoration: BoxDecoration(
            color: widget.enabled ? Colors.orange : Colors.grey[800],
            borderRadius: BorderRadius.circular(5),
          ),
          child: !widget.busy
              ? Text(
                  widget.title,
                  style: buttonTitleTextStyle,
                )
              : const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
        ).moveUpOnHover,
      ),
    );
  }
}
