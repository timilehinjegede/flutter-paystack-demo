import 'package:flutter/material.dart';
import 'package:paystack_demo/views/home.dart';
import 'package:paystack_demo/views/screens/bank_checkout.dart';
import 'package:paystack_demo/views/screens/card_checkout.dart';
import 'package:paystack_demo/views/screens/custom_ui_checkout.dart';
import 'package:paystack_demo/views/screens/select_checkout_option.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        BankCheckoutScreen.routeName : (context) => BankCheckoutScreen(),
        CardCheckoutScreen.routeName : (context) => CardCheckoutScreen(),
        SelectCheckoutOptionScreen.routeName : (context) => SelectCheckoutOptionScreen(),
        CustomUICheckoutScreen.routeName : (context) => CustomUICheckoutScreen(),
      },
      home: HomeScreen(),
    );
  }
}
