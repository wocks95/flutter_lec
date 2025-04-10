import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// hive, path_provider 패키지 설치 필요
// $ flutter pub add hive
// $ flutter pub add path_provider

// hive
//
// hive 는 flutter 와 dart 에서 사용할 수 있는 경량의 NoSQL 데이터베이스입니다.
// 주로 로컬에 데이터를 저장할 때 사용하고 모바일 애플리케이션에서 빠르고 효율적인 데이터 저장 및 검색을 제공합니다.
// hive 는 구조가 간단하고, 사용이 용이하며, 성능이 뛰어나기 때문에 많은 flutter 개발자들이 사용합니다.
//
// 주요 특징
// 1. 경량 및 빠른 성능 :
//   hive 는 메모리 내에서 작동하므로(In Memory 데이터베이스) 데이터의 읽기 및 쓰기 속도가 매우 빠릅니다.
//   데이터베이스의 크기가 커져도 성능 저하가 적다는 특징이 있습니다.
// 2. NoSQL 데이터베이스 :
//   hive 는 스키마가 없는 NoSQL 데이터베이스로, 다양한 형태의 데이터를 자유롭게 저장할 수 있습니다.
//   json 과 같은 복잡한 데이터 구조도 쉽게 처리할 수 있습니다.
// 3. 간편한 사용
//   flutter 는 애플리케이션에 쉽게 통합할 수 있으며 직관적인 API를 제공하기 때문에 데이터 저장, 조회, 삭제 등의 작업을 간단하게 수행할 수 있습니다.
// 4. 비동기 지원
//   hive 는 비동기 작업을 지원하며 UI 스레드와 충돌 없이 데이터를 읽고 쓸 수 있습니다.
// 5. 데이터 암호화
//   hive 는 데이터를 안전하게 보호하기 위한 암호화 기능을 제공합니다.

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HiveState();
}

class _HiveState extends State<HiveScreen> {

  // nullable box
  Box? box;

  // 상태 초기화
  @override
  void initState() {
    super.initState();
    _openHiveBox();  // Box 열기
  }

  // Box 를 여는 메소드
  Future<void> _openHiveBox() async {
    box = await Hive.openBox("myHive");
    setState(() {
      // Box 가 열리면 UI 업데이트
    });
  }

  // Box 기반 데이터베이스 조작 (데이터는 key/value 조합으로 구성)
  // put(), putAll() : 저장
  // get() : 조회
  // delete() : 삭제

  // UI 빌드
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            box == null ? const CircularProgressIndicator() : const Text("Hive Box is opened"),
            ElevatedButton(
              onPressed: () {
                box!.put("spring", "봄");
              },
              child: const Text("단일 데이터 저장")
            ),
            ElevatedButton(
              onPressed: () {
                Map<String, String> dict = {
                  "summer": "여름",
                  "autumn": "가을",
                  "winter": "겨울",
                };
                box!.putAll(dict);
              },
              child: const Text("다중 데이터 저장")
            ),
            ElevatedButton(
              onPressed: () {
                final String value = box!.get("spring");
                print(value);
              },
              child: const Text("단일 데이터 조회")
            ),
            ElevatedButton(
              onPressed: () {
                final int length = box!.length;  // 저장된 데이터의 개수
                final values = box!.values;      // 저장된 values
                final keys = box!.keys;          // 저장된 keys
                print("length = $length");
                print("values = $values");
                print("keys = $keys");
              },
              child: const Text("다중 데이터 조회")
            ),
            ElevatedButton(
              onPressed: () {
                box!.delete("winter");
              },
              child: const Text("단일 데이터 삭제")
            ),
          ],
        ),
      ),
    );

  }

}