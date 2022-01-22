import 'package:flutter/material.dart';

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: widget.onPressed,
          child: InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: widget.enabled ? Colors.orange : Colors.grey[800],
                borderRadius: BorderRadius.circular(6),
              ),
              child: SizedBox(
                child: !widget.busy
                    ? Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
