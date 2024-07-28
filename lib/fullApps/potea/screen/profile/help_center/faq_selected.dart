import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/searchbar_widget.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../../home/filter/filter_screen.dart';
import 'faq_selected_controller.dart';

class FAQSelected extends StatelessWidget {
  final FAQSelectedController faqSelectedController = Get.put(FAQSelectedController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var faqOption in faqSelectedController.model)
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        faqSelectedController.selectFaqOption(faqSelectedController.model.indexOf(faqOption));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: boxDecorationWithRoundedCorners(
                          backgroundColor: faqSelectedController.selectedFaqOption.value == faqSelectedController.model.indexOf(faqOption) ? poteaPrimaryColor : context.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: poteaPrimaryColor, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            faqOption.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: faqSelectedController.selectedFaqOption.value == faqSelectedController.model.indexOf(faqOption) ? Colors.white : poteaPrimaryColor,
                            ),
                          ),
                        ),
                      ).paddingOnly(left: 16),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search Here',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade500),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Image.network(icFlt, width: 24, color: poteaPrimaryColor),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
              onTap: () {
                Get.to(() => SearchBarWidget());
              },
            ),
          ),
          SizedBox(height: 16),
          Obx(
            () {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: faqSelectedController.faqs.length,
                itemBuilder: (context, index) {
                  var faq = faqSelectedController.faqs[index];
                  return FAQItem(question: faq['question']!, answer: faq['answer']!);
                },
              ).paddingSymmetric(horizontal: 16);
            },
          ),
          60.height,
        ],
      ),
    ).expand();
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
