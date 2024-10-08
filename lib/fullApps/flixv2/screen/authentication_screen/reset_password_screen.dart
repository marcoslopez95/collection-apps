import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/flixv2/screen/authentication_screen/verification_screen.dart';
import 'package:access_maketicket/fullApps/flixv2/utils/common_widgets.dart';

import '../../model/startwith_model.dart';

class ResetPasswordScreen extends StatefulWidget {
  List<Map<String, dynamic>>? data;
  String? title;

  ResetPasswordScreen({this.data, this.title});

  State<ResetPasswordScreen> createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  int currentIndex = 0;
  List<StartwithModel> startWith = getStartWithList();

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: customAppBar(
        isLeading: true,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'Reset Password',
                      style: boldTextStyle(size: 22),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Select one of the following methods to reset your password',
                      textAlign: TextAlign.center,
                      style: secondaryTextStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Wrap(
                  runSpacing: 16,
                  children: List.generate(
                    startWith.length,
                    (index) => GestureDetector(
                      onTap: () {
                        currentIndex = index;
                        setState(() {});
                        VerificationScreen(title: startWith[index].title!).launch(context);
                      },
                      child: StartWithComponent(startWith[index], index),
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Or contact ',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  style: ButtonStyle(
                      visualDensity: VisualDensity.compact, padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                  child: Text(
                    'support@movia.com',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(color: Colors.red),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget StartWithComponent(StartwithModel element, int index) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: currentIndex != index
            ? Border.all(width: 2, color: Colors.grey.shade600)
            : Border.all(width: 0, color: Colors.transparent),
        color: currentIndex == index ? Colors.red : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            element.leadingIcon,
            size: 22,
            color: currentIndex == index ? Colors.grey.shade200 : Colors.grey.shade500,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(element.title!,
                      style: boldTextStyle(color: currentIndex == index ? Colors.white : Colors.grey.shade500)),
                  SizedBox(height: 4),
                  Text(element.subtitle!,
                      style: secondaryTextStyle(
                          size: 14, color: currentIndex == index ? Colors.grey.shade200 : Colors.grey.shade500)),
                ],
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: currentIndex == index ? Colors.grey.shade200 : Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}
