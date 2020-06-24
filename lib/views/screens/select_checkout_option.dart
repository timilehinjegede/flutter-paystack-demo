import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:paystack_demo/services/api_service.dart';
import 'package:paystack_demo/views/widgets/dialogs.dart';

class SelectCheckoutOptionScreen extends StatefulWidget {

  static final String routeName = 'selectoptioncheckoutscreen';

  @override
  _SelectCheckoutOptionScreenState createState() => _SelectCheckoutOptionScreenState();
}

class _SelectCheckoutOptionScreenState extends State<SelectCheckoutOptionScreen> {
  bool _hasTransactionStarted = false;

  @override
  void initState() {
    PaystackPlugin.initialize(publicKey: APIService.publicKey);
    super.initState();
  }

  _startCharge() async {
    setState(() {
      _hasTransactionStarted = !_hasTransactionStarted;
    });
    var values = await APIService.initTransaction(APIService.secretKey);

    Charge _charge = Charge()
      ..email = 'user@test.com'
      ..amount = 929200
      ..accessCode = values['data']['access_code'];

    CheckoutResponse _checkoutResponse = await PaystackPlugin.checkout(
      context,
      charge: _charge,
      method: CheckoutMethod.selectable,
    );

    if (_checkoutResponse.status == true) {
      AppDialogs.showSuccessDialog(context, _checkoutResponse.message);
    } else {
      AppDialogs.showErrorDialog(context, _checkoutResponse.message);
    }
    setState(() {
      _hasTransactionStarted = !_hasTransactionStarted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Checkout Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
            child: SizedBox(
              height: 55,
              child: FlatButton(
                shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  _startCharge();
                },
                child: Center(
                  child: _hasTransactionStarted
                      ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                      : Text('Charge'),
                ),
              ),
            )),
      ),
    );
  }
}
