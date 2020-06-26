import 'package:flutter/material.dart';

class CustomUICheckoutScreen extends StatelessWidget {
  static final String routeName = 'customuicheckoutscreen';
  // controller
  var _customerEmailController = TextEditingController();
  var _cardNumberController = TextEditingController();
  var _validThruController = TextEditingController();
  var _cvvController = TextEditingController();

  bool _hasTransactionStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom UI Checkout Screen'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
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
                            shape: BoxShape.circle, color: Colors.orange),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _customerEmailController,
                  decoration: InputDecoration(
                    labelText: 'Customer\'s Email',
                    hintText: 'customer@email.com',
                    hintStyle: TextStyle(fontSize: 14),
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    hintText: '0000 0000 0000 0000',
                    hintStyle: TextStyle(fontSize: 14),
                    labelStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _validThruController,
                        decoration: InputDecoration(
                          labelText: 'Valid Thru',
                          hintText: '00/00',
                          hintStyle: TextStyle(fontSize: 14),
                          labelStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _cvvController,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          hintText: '000',
                          hintStyle: TextStyle(fontSize: 14),
                          labelStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 55,
                  child: FlatButton(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () async {},
                    child: Center(
                      child: _hasTransactionStarted
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text('Charge'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
