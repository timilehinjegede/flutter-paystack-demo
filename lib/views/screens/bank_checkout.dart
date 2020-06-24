import 'package:flutter/material.dart';

class BankCheckoutScreen extends StatelessWidget {

  static final String routeName = 'bankcheckoutscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bank Checkout Screen'
        ),
      ),
      body: Center(
        child: Text(
          'Bank Checkout Screen'
        ),
      ),
    );
  }
}
