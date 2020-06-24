import 'package:flutter/material.dart';
import 'package:paystack_demo/views/screens/bank_checkout.dart';
import 'package:paystack_demo/views/screens/card_checkout.dart';
import 'package:paystack_demo/views/screens/custom_ui_checkout.dart';
import 'package:paystack_demo/views/screens/select_checkout_option.dart';
import 'package:paystack_demo/views/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paystack Demo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            AppButton(
              content: 'Bank Checkout',
              onTap: () => Navigator.pushNamed(context, BankCheckoutScreen.routeName),
            ),

            SizedBox(
              height: 20,
            ),

            AppButton(
              content: 'Card Checkout',
              onTap: () => Navigator.pushNamed(context, CardCheckoutScreen.routeName),
            ),

            SizedBox(
              height: 20,
            ),

            AppButton(
              content: 'Select Option Checkout',
              onTap: () => Navigator.pushNamed(context, SelectCheckoutOptionScreen.routeName),
            ),

            SizedBox(
              height: 20,
            ),

            AppButton(
              content: 'Custom UI Checkout',
              onTap: () => Navigator.pushNamed(context, CustomUICheckoutScreen.routeName),
            ),

          ],
        ),
      ),
    );
  }
}
