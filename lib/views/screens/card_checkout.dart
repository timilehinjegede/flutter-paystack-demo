import 'package:flutter/material.dart';

class CardCheckoutScreen extends StatelessWidget {

  static final String routeName = 'cardcheckoutscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Card Checkout Screen'
        ),
      ),
      body: Center(
        child: Text(
            'Card Checkout Screen'
        ),
      ),
    );  }
}
