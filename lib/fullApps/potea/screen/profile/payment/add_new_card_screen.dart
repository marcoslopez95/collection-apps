import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/utils/common_base.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Add New Card', style: TextStyle(fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.network(
            icMore,
            color: appStore.isDarkModeOn ? white : black,
            width: 20,
          ),
        ),
      ],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: poteaPrimaryColor),
                  child: Stack(
                    children: [
                      Image.network(walletTrans, fit: BoxFit.cover, height: 200),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Mocard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white)),
                              Spacer(),
                              Image.network(icAmazon, height: 25),
                            ],
                          ),
                          Text('.... .... .... ....', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: white)),
                          SizedBox(height: Get.height * 0.026),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Card Holder name', style: TextStyle(color: white, fontSize: 14)),
                                  Text('.... ....', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white)),
                                ],
                              ),
                              SizedBox(width: Get.width * 0.04),
                              Column(
                                children: [
                                  Text('Expiry date', style: TextStyle(color: white, fontSize: 14)),
                                  Text('.... / ....', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white)),
                                ],
                              ),
                              SizedBox(width: Get.width * 0.04),
                              Image.network(walletCardPayment, height: 45),
                            ],
                          ),
                        ],
                      ).paddingAll(24),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Card Name'),
                ).paddingSymmetric(horizontal: 16),
                8.height,
                AppTextField(
                  textStyle: TextStyle(fontSize: 12),
                  textFieldType: TextFieldType.NAME,
                  titleTextStyle: TextStyle(fontSize: 14),
                  decoration: inputDecoration(
                    context,
                    hintText: 'andrew Ainsley',
                    fillColor: context.cardColor,
                    filled: true,
                    borderRadius: 15,
                  ),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Card Number'),
                ).paddingSymmetric(horizontal: 16),
                8.height,
                AppTextField(
                  textStyle: TextStyle(fontSize: 12),
                  textFieldType: TextFieldType.NAME,
                  titleTextStyle: TextStyle(fontSize: 14),
                  decoration: inputDecoration(
                    context,
                    hintText: '2672 4738 7837 7285',
                    fillColor: context.cardColor,
                    filled: true,
                    borderRadius: 15,
                  ),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Expiry Date'),
                        8.height,
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: AppTextField(
                            textStyle: TextStyle(fontSize: 12),
                            textFieldType: TextFieldType.NAME,
                            titleTextStyle: TextStyle(fontSize: 14),
                            decoration: inputDecoration(
                              context,
                              hintText: '09/07/26',
                              fillColor: context.cardColor,
                              filled: true,
                              borderRadius: 15,
                            ),
                            suffix: icMail.iconImage(fit: BoxFit.contain).paddingAll(14),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CVV'),
                        8.height,
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: AppTextField(
                            textStyle: TextStyle(fontSize: 12),
                            textFieldType: TextFieldType.NAME,
                            titleTextStyle: TextStyle(fontSize: 14),
                            decoration: inputDecoration(
                              context,
                              hintText: '699',
                              fillColor: context.cardColor,
                              filled: true,
                              borderRadius: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              elevation: 0,
              width: Get.width,
              color: poteaPrimaryColor,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onTap: () {
                Get.back();
              },
              child: Text('Add', style: TextStyle(fontSize: 16, color: white)),
            ).paddingSymmetric(horizontal: 16, vertical: 25),
          ),
        ],
      ),
    );
  }
}
