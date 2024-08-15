import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../../../main.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/image.dart';
import 'chart_controller.dart';
import 'chat_widget.dart';

class CustomerService extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      actions: [
        Image.network(icTelephone, width: 20, color: appStore.isDarkModeOn ? white : black),
        8.width,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(icMore, width: 20, color: appStore.isDarkModeOn ? white : black),
        ),
        8.width,
      ],
      appBarTitle: Text('Customer Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: context.cardColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Today'),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  return ChatBubble(
                    text: message.text,
                    isSent: message.isSent,
                    time: message.time,
                  );
                },
              ),
            ),
          ),
          _buildTextField(context),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 12),
              cursorColor: poteaPrimaryColor,
              decoration: InputDecoration(
                fillColor: context.cardColor,
                filled: true,
                hintText: "Message...",
                border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Image(image: NetworkImage(icGallary), height: 20, color: appStore.isDarkModeOn ? white : black),
                ),
              ),
              minLines: 1,
              maxLines: 5,
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: poteaPrimaryColor),
              child: Image(image: NetworkImage(icMicMain), height: 30).paddingAll(Get.height * 0.015),
            ),
          ),
        ],
      ),
    );
  }
}
