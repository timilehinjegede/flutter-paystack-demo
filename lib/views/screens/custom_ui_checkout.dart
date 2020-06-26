import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:paystack_demo/services/api_service.dart';
import 'package:paystack_demo/views/widgets/dialogs.dart';

class CustomUICheckoutScreen extends StatefulWidget {
  static final String routeName = 'customuicheckoutscreen';

  @override
  _CustomUICheckoutScreenState createState() => _CustomUICheckoutScreenState();
}

class _CustomUICheckoutScreenState extends State<CustomUICheckoutScreen> {
  var _customerEmailController = TextEditingController();

  var _cardNumberController = TextEditingController();

  var _validThruController = TextEditingController();

  var _cvvController = TextEditingController();

  bool _hasTransactionStarted = false;

  @override
  void initState() {
    super.initState();
    PaystackPlugin.initialize(publicKey: APIService.publicKey);
  }

  PaymentCard _getCardFromUI() {
    return PaymentCard(
      number: _cardNumberController.text,
      cvc: _cvvController.text,
      expiryMonth: int.parse(_validThruController.text),
      expiryYear: int.parse(_validThruController.text),
    );
  }

  _startCharge() async {
    var values = await APIService.initTransaction(APIService.secretKey);

    Charge _charge = Charge()
      ..email = _customerEmailController.text
      ..accessCode = values['data']['access_code']
      ..amount = 92001
      ..card = _getCardFromUI();

    await PaystackPlugin.chargeCard(context,
        charge: _charge,
        beforeValidate: (transaction) => handleBeforeValidate(transaction),
        onSuccess: (transaction) => handleOnSuccess(transaction),
        onError: (error, transaction) => handleOnError(error, transaction));
  }

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
                    onPressed: () async {
                      _startCharge();
                    },
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

  handleOnSuccess(Transaction transaction) {
    setState(() {
      _hasTransactionStarted = false;
    });
    AppDialogs.showSuccessDialog(context, transaction.message);
  }

  handleBeforeValidate(Transaction transaction) {
    print(transaction.message);
  }

  handleOnError(Object error, Transaction transaction) {
    setState(() {
      _hasTransactionStarted = false;
    });
    print(transaction.message);
    print(error);
    AppDialogs.showErrorDialog(context, transaction.message);
  }
}
