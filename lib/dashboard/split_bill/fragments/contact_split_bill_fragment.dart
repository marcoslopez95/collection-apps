import 'package:flutter/material.dart';
import 'package:access_maketicket/dashboard/split_bill/fragments/home_split_bill_fragment.dart';

class ContactSplitBillFragment extends StatefulWidget {
  @override
  _ContactSplitBillFragmentState createState() => _ContactSplitBillFragmentState();
}

class _ContactSplitBillFragmentState extends State<ContactSplitBillFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return HomeSplitBillFragment();
  }
}
