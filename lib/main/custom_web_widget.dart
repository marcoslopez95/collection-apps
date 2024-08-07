import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomWebWidget extends StatelessWidget {
  final Widget child;

  const CustomWebWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return child;
    }
    return child;
  }
}
