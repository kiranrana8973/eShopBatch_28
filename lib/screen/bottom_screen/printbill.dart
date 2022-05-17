import 'package:flutter/material.dart';

class PrintBillScreen extends StatelessWidget {
  const PrintBillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("print bill screen"),
        ),
      ),
    );
  }
}
