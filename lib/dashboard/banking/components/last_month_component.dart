import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/dashboard/banking/components/bottomSheet_component.dart';
import 'package:access_maketicket/dashboard/banking/models/banking_info_model.dart';
import 'package:access_maketicket/dashboard/banking/utils/colors.dart';
import 'package:access_maketicket/main.dart';

class LastMonthComponent extends StatelessWidget {
  const LastMonthComponent({
    Key? key,
    required this.lastMonthData,
    required this.isNegativeSign,
    required this.setLastWeekDetail,
    required this.index,
  }) : super(key: key);

  final int index;
  final BankingInfoModel lastMonthData;
  final bool isNegativeSign;
  final List<BankingInfoModel> setLastWeekDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('${lastMonthData.lastWeekTitle}', style: boldTextStyle()),
          subtitle: Text('${lastMonthData.lastWeekSubTitle}'),
          horizontalTitleGap: 5,
          minVerticalPadding: 14,
          dense: true,
          leading: Padding(
            padding: EdgeInsets.only(top: 3),
            child: Image.asset(lastMonthData.lastWeekIcons!, height: 35, width: 35),
          ),
          trailing: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isNegativeSign ? null : bankingLightGreen,
              borderRadius: radius(6),
            ),
            child: Text(
              '${lastMonthData.lastWeekAmount}',
              style: boldTextStyle(color: isNegativeSign ? null : primaryBankingColor2),
            ),
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                  borderRadius: radiusOnly(topLeft: 25, topRight: 25),
                ),
                builder: (context) {
                  return BottomSheetDetails(
                    title: lastMonthData.lastWeekTitle,
                    subTitle: lastMonthData.lastWeekSubTitle,
                    icon: lastMonthData.lastWeekIcons,
                    amount: lastMonthData.lastWeekAmount,
                    isNegativeSign: isNegativeSign,
                  );
                });
          },
        ),
        if (setLastWeekDetail.length != index + 1) Divider(thickness: 2, color: appStore.isDarkModeOn ? dividerBankingBlackColor : dividerBankingColor, height: 0),
      ],
    );
  }
}
