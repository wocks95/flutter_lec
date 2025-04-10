import 'package:flutter/material.dart';
import 'package:j_hive_provider/viewmodel/HiveViewModel.dart';

// 상태 변경을 알리기 위해 ChangeNotifier 함께 사용

class HiveProvider with ChangeNotifier {

  final HiveViewModel _viewModel = HiveViewModel();
  bool _isOpened = false;

  HiveViewModel get viewModel => _viewModel;
  bool get isOpened => _isOpened;

  Future<void> initialize() async {
    await _viewModel.initialize();
    _isOpened = true;   // 상태 변함
    notifyListeners();  // 상태가 변했음을 알림
  }

  /* 저장 / 삭제의 경우 상태 변화로 처리함 */

  // 단일 데이터 저장
  Future<void> registData(String key, dynamic value) async {
    await _viewModel.registData(key, value);
    notifyListeners();
  }

  // 다중 데이터 저장
  Future<void> registBulkData(Map<String, dynamic> data) async {
    await _viewModel.registBulkData(data);
    notifyListeners();
  }

  // 데이터 삭제
  Future<void> deleteData(String key) async {
    await _viewModel.deleteData(key);
    notifyListeners();
  }

  /* 조회의 경우 상태 변화 없음으로 처리함 */
  
  // 단일 데이터 조회
  dynamic getData(String key) {
    return _viewModel.getData(key);
  }

  // 다중 데이터 조회
  Map<dynamic, dynamic> getAllData() {
    return _viewModel.getAllData();
  }

}