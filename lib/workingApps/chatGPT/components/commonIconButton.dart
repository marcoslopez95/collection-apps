import 'package:flutter/material.dart';
import 'package:access_maketicket/main.dart';

class CommonIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String? toolTip;
  final double? iconSize;

  CommonIconButton({required this.onPressed, required this.icon, this.toolTip, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
      visualDensity: VisualDensity.compact,
      splashRadius: 22,
      tooltip: toolTip,
      iconSize: iconSize,
    );
  }
}
