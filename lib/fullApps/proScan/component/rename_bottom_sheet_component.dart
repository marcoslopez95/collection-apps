import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/proScan/component/text_form_field_label_text.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/color.dart';
import 'package:prokit_flutter/fullApps/proScan/utils/constant.dart';

import '../../../main.dart';
import '../utils/common.dart';
import 'AppButton.dart';

Future<dynamic> RenameBottomSheetComponent(BuildContext context, double height) {
  return showModalBottomSheet(
    backgroundColor: appStore.isDarkModeOn ? proScanDarkPrimaryLightColor : Colors.white,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(PRO_SCAN_DEFAULT_RADIUS)),
    ),
    elevation: 0,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Container(
                height: 2,
                width: 40,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(PRO_SCAN_DEFAULT_RADIUS)),
              ),
              SizedBox(height: 16),
              Text("Rename", style: boldTextStyle(fontSize: 24)),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              TextFormFieldLabelText(text: "New Name"),
              TextFormField(
                decoration: inputDecoration(hintText: "Enter new name"),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: "Cancel",
                      color: appStore.isDarkModeOn ? proScanDarkPrimaryColor : proScanPrimaryLightColor,
                      textColor: appStore.isDarkModeOn ? Colors.white : proScanPrimaryColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      text: "Rename",
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your file renamed successfully")));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
