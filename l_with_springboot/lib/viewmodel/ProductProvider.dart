import 'package:flutter/material.dart';
import 'package:l_with_springboot/model/Product.dart';
import 'package:l_with_springboot/service/ProductAPIService.dart';

class ProductProvider with ChangeNotifier {

  final ProductAPIService _apiService = ProductAPIService();

  List<Product> _products = [];  // 비공개 _products (상태), 상품 목록
  List<Product> get products => _products;  // _products 의 getter (View 에서는 products 라는 이름으로 호출)

  late Product _product; // 비공개 _product (상태)
  Product get product => _product; // _product 의 getter (View 에서는 product 이름으로 호출)

  Future<void> registProduct(Product product) async {
    try {
      final Product newProduct = await _apiService.registProduct(product);
      _products.add(newProduct); // 상태가 변함
      notifyListeners(); // 상태 변화 알림
    } catch (e) {
      print("----- registProduct : $e");
    }
  }

  Future<void> fetchProducts() async {
    try {
      _products = await _apiService.getProductList();  // 상태가 변함
      notifyListeners();  // 상태 변화 알림
    } catch (e) {
      print("----- fetchProducts : $e");
    }
  }

  Future<void> getProductById(int id) async {
    try {
      _product = await _apiService.getProductById(id); // 상태 변화
      notifyListeners(); // 상태변화 알림
    } catch (e) {
      print("----- getProductById : $e");
    }
  }

  Future<void> modifyProdcut(Product product) async {
    try{
      final modifiedProduct = await _apiService.modifyProduct(product);
      // id 가 일치하는 product 의 인덱스 계산하기
      // final index = _products.indexWhere((p) { return p.id == modifiedProduct.id; }); // p :  상품 목록에 저장된 각 상품
      final index = _products.indexWhere((p) => p.id == modifiedProduct.id );
      // indexWhere() 메소드는 못 찾으면 -1 을 반환
      if(index != -1) {
        _products[index] = modifiedProduct; // 상태 변경
        notifyListeners();
      } else {
        throw Exception("Failed to find product");
      }
    } catch (e) {
      print("----- modifyProduct : $e");
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await _apiService.deleteProduct(id);
      _products.removeWhere((p) => p.id == id); // p :  상품 목록에 저장된 각 상품
      notifyListeners();
    } catch(e) {
      print("----- deleteProduct : $e");
    }
  }

}