import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../../main.dart';
import '../../../../utils/colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSent;
  final String time;

  ChatBubble({required this.text, required this.isSent, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isSent
                    ? poteaPrimaryColor
                    : appStore.isDarkModeOn
                        ? Color(0xFF35383F)
                        : lightaddressColor,
                borderRadius: isSent
                    ? BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(20))
                    : BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: isSent
                            ? white
                            : appStore.isDarkModeOn
                                ? white
                                : black,
                      ),
                    ),
                  ),
                  Text(time, style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
