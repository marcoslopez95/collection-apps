import 'package:flutter/material.dart';
import 'package:access_maketicket/dashboard/analytics/fragments/analytics_dashboard_fragment.dart';

class ToolsFragment extends StatefulWidget {
  @override
  _ToolsFragmentState createState() => _ToolsFragmentState();
}

class _ToolsFragmentState extends State<ToolsFragment> {
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
    return AnalyticsDashboardFragment();
  }
}
