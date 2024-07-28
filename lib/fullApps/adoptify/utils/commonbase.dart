import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../generated/assets.dart';
import 'color.dart';

TextStyle get appButtonTextStyleGray => secondaryTextStyle(color: adoptifySecondaryColor, size: 14, fontFamily: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w500).fontFamily);

TextStyle get appButtonTextStyleWhite => secondaryTextStyle(color: Colors.white, size: 14, fontFamily: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w600).fontFamily);

TextStyle get appButtonPrimaryColorText => secondaryTextStyle(color: adoptifyPrimaryColor, fontFamily: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w500).fontFamily);

TextStyle get appButtonFontColorText => secondaryTextStyle(color: Colors.grey, size: 14, fontFamily: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w500).fontFamily);

InputDecoration inputDecoration(BuildContext context, {Widget? prefixIcon, BoxConstraints? prefixIconConstraints, Widget? suffixIcon, String? labelText, String? hintText, double? boederRadius, bool? filled, Color? fillColor}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.only(left: 12, bottom: 10, top: 10, right: 10),
    labelText: labelText,
    hintText: hintText,
    hintStyle: secondaryTextStyle(size: 12, fontFamily: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w300).fontFamily),
    labelStyle: secondaryTextStyle(size: 12, fontFamily: GoogleFonts.beVietnamPro(fontWeight: FontWeight.w300).fontFamily),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon,
    prefixIconConstraints: prefixIconConstraints,
    suffixIcon: suffixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(boederRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Color(0xFFD8D9D9), width: 0.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(boederRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Colors.red, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(boederRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    errorMaxLines: 2,
    border: OutlineInputBorder(
      borderRadius: radius(boederRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Color(0xFFD8D9D9), width: 0.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: radius(boederRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Color(0xFFD8D9D9), width: 0.0),
    ),
    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(boederRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Color(0xFF9D67EF), width: 0.0),
    ),
    filled: filled,
    fillColor: fillColor,
  );
}

extension StrEtx on String {
  String get firstLetter => isNotEmpty ? this[0] : '';

  Widget iconImage({double? size, Color? color, BoxFit? fit}) {
    return Image.asset(
      this,
      height: size ?? 14,
      width: size ?? 14,
      fit: fit ?? BoxFit.cover,
      color: Colors.white,
      //:Colors.darkGra ,
      errorBuilder: (context, error, StackTrace) {
        return Image.asset(
          Assets.iconsIcNoPhoto,
          height: size ?? 14,
          width: size ?? 14,
        );
      },
    );
  }
}

Widget commonLeading({required String imgPath, required IconData icon, Color? color, double size = 20}) {
  return Image.asset(
    imgPath,
    width: size,
    height: size,
    color: color,
    fit: BoxFit.contain,
    errorBuilder: (context, error, StackTrace) => Icon(icon, color: Color(0xFFFD866E), size: size),
  );
}

void hideKeyBoardWithoutContext() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

Widget backButton({Object? result}) {
  return IconButton(
    onPressed: () {
      Get.back(result: result);
    },
    icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.grey, size: 20),
  );
}
