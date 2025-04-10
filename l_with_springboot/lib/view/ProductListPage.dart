import 'package:flutter/material.dart';
import 'package:l_with_springboot/model/Product.dart';
import 'package:l_with_springboot/viewmodel/ProductProvider.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Provider 등록
    final productProvider = context.read<ProductProvider>();

    // 최초 빌드 시점에서 Product 목록 로드하기
    WidgetsBinding.instance.addPostFrameCallback((duration) {  // 매개변수 duration 을 사용하지 않는다면 (_) { }
      if(productProvider.products.isEmpty) {  // 상품 목록이 비어 있으면
        productProvider.fetchProducts();  // 상품 목록 가져오기
      }
    });

    // UI 빌드
    return Scaffold(
      appBar: AppBar(title: const Text("Product App")),
      body: Consumer<ProductProvider>(  // 상태가 변하면 해당 부분의 리빌드를 위해 (전체 리빌드가 아닌) Consumer 사용
        builder: (context, provider, child) {
          // builder() 는 화면에 표시할 UI 를 반환함
          if(provider.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.products.length,
            itemBuilder: (context, index) {  // itemBuilder : Product 하나를 만들어서 UI 로 반환
              final product = provider.products[index];  // Product
              return Card(
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  leading: Checkbox(
                    value: true, onChanged: (value) { }
                  ),
                  title: Text(product.name, style: TextStyle(fontWeight: FontWeight.w900),),
                  subtitle: Text(product.price.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/modify",
                            arguments: product,
                          );
                        },
                        icon: const Icon(Icons.edit, color: Colors.blue,),
                      ),
                      IconButton(
                        onPressed: () {
                          _showDialogDelete(context, product.id);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red,),
                      ),
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/regist");
        },
        child: const Icon(Icons.add),
      ),
    );

  }
  void _showDialogDelete(BuildContext context, int? id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Product Delete"),
          content: const Text("Do you wnat to delete this product?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // 뒤로 가기 (AlertDialog) 닫기
              child: const Text("취소"),
            ),
            TextButton(
              onPressed: () {
                context.read<ProductProvider>().deleteProduct(id!);
                Navigator.pop(context); // 뒤로 가기 (AlertDialog) 닫기
              },
              child: const Text("삭제"),
            ),
          ],
        );
      }
    );
  }

}