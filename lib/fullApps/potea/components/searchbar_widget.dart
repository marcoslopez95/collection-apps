import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/components/search_bar_controller.dart';

import '../screen/home/filter/filter_screen.dart';
import '../utils/colors.dart';
import '../utils/image.dart';

class SearchBarWidget extends StatelessWidget {
  final SearchBarController controller = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasLeadingWidget: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: context.cardColor,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
              hintText: 'Search Here',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade500),
              suffixIcon: IconButton(
                icon: Image.network(context.isDarkMode ? icFltWhite : icFlt, width: 24),
                onPressed: () {
                  hideKeyboard(context);
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return filter_bottom();
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                TextButton(
                  onPressed: () => controller.clearAll(),
                  child: Text('Clear All', style: TextStyle(color: poteaPrimaryColor, fontSize: 16)),
                ),
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.plantTypeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.plantTypeList[index]),
                    trailing: IconButton(
                      icon: Image.network(context.isDarkMode ? icCloseWhite : icClose, width: 18),
                      onPressed: () => controller.plantTypeList.removeAt(index),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
