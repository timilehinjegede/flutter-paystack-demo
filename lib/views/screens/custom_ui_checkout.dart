import 'package:flutter/material.dart';

class CustomUICheckoutScreen extends StatelessWidget {

  static final String routeName = 'customuicheckoutscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Custom UI Checkout Screen'
        ),
      ),
      body: Center(
        child: Text(
            'Custom UI Checkout Screen'
        ),
      ),
    );
  }
}
