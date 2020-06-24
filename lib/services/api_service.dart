import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  // secret key
  static final String secretKey = '';
  // public key
  static final String publicKye = '';

  // initialize transaction url
  static final String initTransactionUrl =
      'https://api.paystack.co/transaction/initialize';

  // initialize transaction connection
  Future initTransaction(String secretKey) async {
    // headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $secretKey'
    };

    // body
    Map<String, String> body = {
      "amount": '600',
      "email": "johnsonoye34@gmail.com"
    };

     // api connection
    var response = await http.post(APIService.initTransactionUrl, headers: headers, body: jsonEncode(body));
    print(response);
    print(response.body);
    return response.body;
  }
}
