import 'package:eshopping/utils/api_url.dart';
import 'package:eshopping/utils/showMessage.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    displaySuccessMessage(context, token!);

    return const Scaffold(
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
