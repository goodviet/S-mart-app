import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:takehome/model/product.class.dart';

class AppService {
  http.Client _http = http.Client();

  AppService() {
    _http = http.Client();
  }
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const String url_server = 'http://localhost:3000/';

  Future<List<dynamic>> getAPIProduct() async {
    var response =
        await http.get(Uri.parse(url_server + 'dataProduct/getListData'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['listProduct'];
    } else {
      print('Failed to load data');
      return [];
    }
  }

  Future<http.Response> postCreateProduct(dynamic data) async {
    var urlRegister = Uri.parse(url_server + 'dataProduct/createProduct');

    final postdataFromClient = await this
        ._http
        .post(urlRegister, body: jsonEncode(data), headers: headers);

    return postdataFromClient;
  }

  Future<List<dynamic>> deleteProduct(id) async {
    var response = await http
        .delete(Uri.parse(url_server + 'dataProduct/deleteProduct/${id}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['listProduct'];
    } else {
      print('Failed to load data');
      return [];
    }
  }

  Future<http.Response> updateProduct(dynamic data, id) async {
    var urlRegister = Uri.parse(url_server + 'dataProduct/updateProduct/${id}');

    final updatedataFromClient = await this
        ._http
        .put(urlRegister, body: jsonEncode(data), headers: headers);

    return updatedataFromClient;
  }


  Future<Map<String, dynamic>> getDetailProduct(id) async {
    var response = await http
        .get(Uri.parse(url_server + 'dataProduct/getDetailProduct/${id}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data['data'];
    } else {
      print('Failed to load data');
      return {};
    }
  }
}
