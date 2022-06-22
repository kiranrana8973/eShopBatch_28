import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WearOsDashboardScreen extends StatefulWidget {
  const WearOsDashboardScreen({Key? key}) : super(key: key);

  @override
  State<WearOsDashboardScreen> createState() => _WearOsDashboardScreenState();
}

class _WearOsDashboardScreenState extends State<WearOsDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return const Scaffold(
              body: Center(
                child: Text('Dashboard'),
              ),
            );
          },
        );
      },
    );
  }
}
