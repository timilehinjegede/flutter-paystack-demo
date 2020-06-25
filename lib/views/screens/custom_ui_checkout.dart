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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[

            SizedBox(height: 25,),

            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black87.withOpacity(0.8),
              ),
              child: Column(
                children: <Widget>[

                  // master card like logo
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
