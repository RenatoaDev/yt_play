import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatefulWidget {
  final IconData? icon;
  final VoidCallback onTap;
  final String label;

  const OutlinedButtonWidget(
      {Key? key, this.icon, required this.onTap, required this.label})
      : super(key: key);

  @override
  State<OutlinedButtonWidget> createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: widget.onTap,
      icon: Icon(
        widget.icon,
        color: Colors.black,
        size: 24.0,
      ),
      label: Text(
        widget.label,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
