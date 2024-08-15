import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/potea/screen/wallet/ewallet/top_up_amount_controller.dart';

import '../utils/colors.dart';

class AmountButtonRow extends StatelessWidget {
  final List<int> amounts;
  final TopUpAmountController controller;

  const AmountButtonRow({Key? key, required this.amounts, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var amount in amounts)
          GestureDetector(
            onTap: () => controller.selectAmount(amount),
            child: Obx(
              () => AmountButton(amount: amount, isSelected: controller.selectedAmount.value == amount),
            ),
          ),
      ],
    );
  }
}

class AmountButton extends StatelessWidget {
  final int amount;
  final bool isSelected;

  const AmountButton({Key? key, required this.amount, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: poteaPrimaryColor),
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? poteaPrimaryColor.withOpacity(0.2) : Colors.transparent,
      ),
      child: Center(
        child: Text('\$$amount', style: TextStyle(fontSize: 14, color: poteaPrimaryColor)),
      ),
    );
  }
}
