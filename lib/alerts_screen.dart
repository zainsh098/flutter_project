import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security Alerts'),
      ),
      body: Center(
        child: Text('Alerts for Unauthorized Access or Activity'),
      ),
    );
  }
}
