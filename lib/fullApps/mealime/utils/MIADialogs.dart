import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/mealime/models/MIAMealModel.dart';
import 'package:access_maketicket/fullApps/mealime/screens/MIASplashScreen.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

void displayDeleteDialog(BuildContext context, MIAMealModel element) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CustomTheme(
            child: CupertinoAlertDialog(
              title: Text(
                'Delete?',
                style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
              ),
              content: Text(
                'Are you sure want to delete this meal?',
                style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    'Cancel',
                    style: primaryTextStyle(color: dodgerBlue, size: 18),
                  ),
                  onPressed: () {
                    finish(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    'Delete',
                    style: primaryTextStyle(color: redColor, size: 18),
                  ),
                  onPressed: () {
                    miaStore.removeMeal(header: element.header!, element: element, name: element.text);
                    finish(context);
                  },
                )
              ],
            ),
          ));
}
