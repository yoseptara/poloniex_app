import 'dart:convert';

import 'package:http/http.dart' as http;


class PriceRepository {
  Future<String?> fetchPoloniexWebsocketToken() async {
    final res = await http.post(
      Uri.parse('https://futures-api.poloniex.com/api/v1/bullet-public'),
    );

    final decodedRes = json.decode(res.body);
    return decodedRes?['data']?['token'];
  }
}