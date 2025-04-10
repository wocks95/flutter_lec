import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:j_hive_provider/view/01_stateful/HiveScreen.dart';
import 'package:j_hive_provider/view/02_provider/HiveProviderScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
        // const HiveScreen(),
        const HiveProviderScreen(),
    );
  }

}