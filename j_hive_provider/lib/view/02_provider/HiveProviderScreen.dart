import 'package:flutter/material.dart';
import 'package:j_hive_provider/view/00_common/ButtonWidget.dart';
import 'package:j_hive_provider/view/02_provider/HiveProvider.dart';
import 'package:provider/provider.dart';

// HiveProvider 의 notifyListeners() 호출로 UI 가 자동으로 갱신되므로
// 수동으로 setState() 를 호출할 필요가 없어, 상태 관리가 자동화 됩니다.

class HiveProviderScreen extends StatelessWidget {  // StatefulWidget 이 아님

  const HiveProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {  // Provider 생성 후 반환
        HiveProvider provider = HiveProvider();
        provider.initialize();
        return provider;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hive and Provider"),
        ),
        body: Consumer<HiveProvider>(
          builder: (BuildContext context, HiveProvider provider, Widget? child) {
            if(provider.isOpened) {
              return ButtonWidget(viewModel: provider.viewModel);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      )
    );
  }

}