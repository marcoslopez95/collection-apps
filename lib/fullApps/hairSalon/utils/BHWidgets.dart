import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/hairSalon/model/BHModel.dart';
import 'package:access_maketicket/main.dart';

import 'BHColors.dart';

Widget textFieldWidget(String hintText, TextEditingController controller, {bool obscureText = false, bool isPassword = true}) {
  return TextFormField(
    obscureText: isPassword,
    style: TextStyle(color: Colors.black),
    controller: controller,
    decoration: InputDecoration(
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      labelText: hintText,
      labelStyle: TextStyle(color: Colors.grey),
      suffixIcon: GestureDetector(
        onTap: () {
          isPassword = !isPassword;
        },
        child: Icon(
          isPassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget raiseButton({required String btnText, Color? color}) {
  return Container(
    width: 130,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8), backgroundColor: color,
        shape: RoundedRectangleBorder(side: BorderSide(color: BHGreyColor)),
      ),
      onPressed: () {},
      child: Text(
        btnText,
        style: TextStyle(
          color: BHAppTextColorSecondary,
          fontSize: 15,
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class EditTextFieldWidget extends StatefulWidget {
  static String tag = '/EditTextFieldWidget';

  String? hintText = '';
  TextEditingController? controller;
  bool? isPassword;
  bool? showPassword = false;

  EditTextFieldWidget({this.hintText, this.controller, this.showPassword});

  @override
  EditTextFieldWidgetState createState() => EditTextFieldWidgetState();
}

class EditTextFieldWidgetState extends State<EditTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(color: Colors.black),
      // obscureText: !showPassword,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        labelText: widget.hintText,
        labelStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final BHMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          margin: isMe.validate() ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (500 * 0.25).toDouble()) : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 0, right: (500 * 0.25).toDouble()),
          decoration: BoxDecoration(
            color: !isMe ? Colors.red.withOpacity(0.85) : context.cardColor,
            boxShadow: defaultBoxShadow(),
            borderRadius: isMe.validate()
                ? BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10), topRight: Radius.circular(10))
                : BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
            border: Border.all(color: isMe ? Theme.of(context).dividerColor : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(data.msg!,
                      style: primaryTextStyle(
                          color: !isMe
                              ? white
                              : appStore.isDarkModeOn
                                  ? white
                                  : textPrimaryColor))),
              Text(
                data.time!,
                style: secondaryTextStyle(
                    color: !isMe
                        ? white
                        : appStore.isDarkModeOn
                            ? gray
                            : textSecondaryColor,
                    size: 12),
              )
            ],
          ),
        ),
      ],
    );
  }
}
