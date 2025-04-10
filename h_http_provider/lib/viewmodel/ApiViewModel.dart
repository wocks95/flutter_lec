import 'package:flutter/material.dart';
import 'package:h_http_provider/model/ResponseData.dart';
import 'package:h_http_provider/service/ApiService.dart';

class ApiViewModel with ChangeNotifier {

  ResponseData _data = ResponseData(name: "", count: 0, age: 0);
  final ApiService _apiService = ApiService();



  ResponseData? get data => _data;

  Future<void> fetchAPI(String name) async {
    _data = await _apiService.callAPI(name);
    notifyListeners();
  }

}