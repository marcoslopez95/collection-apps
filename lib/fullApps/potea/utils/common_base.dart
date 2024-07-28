import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import 'colors.dart';
import 'image.dart';

Widget get commonDivider => Column(
      children: [
        Divider(
          indent: 3,
          height: 1,
          color: borderColor.withOpacity(0.2),
        ),
      ],
    );

Widget backButton({Object? result}) {
  return IconButton(
    onPressed: () {
      Get.back(result: result);
    },
    icon: const Icon(Icons.arrow_back_rounded, color: Colors.grey, size: 24),
  );
}

InputDecoration inputDecoration(BuildContext context, {Widget? prefixIcon, BoxConstraints? prefixIconConstraints, Widget? suffixIcon, String? labelText, String? hintText, double? borderRadius, bool? filled, Color? fillColor}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
    labelText: labelText,
    hintText: hintText,
    hintStyle: TextStyle(fontSize: 12),
    labelStyle: TextStyle(fontSize: 12),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon,
    prefixIconConstraints: prefixIconConstraints,
    suffixIcon: suffixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide.none,
    ),
    errorMaxLines: 2,
    border: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide.none,
    ),
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide.none,
    ),
    filled: filled,
    fillColor: fillColor,
  );
}

extension StrEtx on String {
  Widget iconImage({double? size, Color? color, BoxFit? fit}) {
    return Image.network(
      this,
      height: size ?? 14,
      width: size ?? 14,
      fit: fit ?? BoxFit.cover,
      color: color ?? (appStore.isDarkModeOn ? Colors.white : darkGray),
      errorBuilder: (context, error, stackTrace) {
        return Image.network(icNoPhoto, height: size ?? 14, width: size ?? 14);
      },
    );
  }

  String get firstLetter => isNotEmpty ? this[0] : '';
}
