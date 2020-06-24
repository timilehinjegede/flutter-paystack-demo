import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  // secret key
  static final String secretKey = 'sk_test_032d9ecba0fb89ea8646b62f8a630d9dfc0d4121';
  // public key
  static final String publicKey = 'pk_test_9e2459b5a020ee05549dbed451855ced57d28b26';

  // initialize transaction url
  static final String initTransactionUrl =
      'https://api.paystack.co/transaction/initialize';

  // initialize transaction connection
  static Future initTransaction(String secretKey) async {
    // headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $secretKey'
    };

    // body
    Map<String, String> body = {
      "amount": '9000',
      "email": "johnsonoye34@gmail.com"
    };

     // api connection
    var response = await http.post(APIService.initTransactionUrl, headers: headers, body: jsonEncode(body));
//    print(response.body);
    var values = jsonDecode(response.body);
    return values;
  }
}
