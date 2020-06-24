import 'package:flutter/material.dart';

class BankCheckoutScreen extends StatefulWidget {

  static final String routeName = 'bankcheckoutscreen';

  @override
  _BankCheckoutScreenState createState() => _BankCheckoutScreenState();
}

class _BankCheckoutScreenState extends State<BankCheckoutScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
