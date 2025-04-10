import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_http_provider/viewmodel/ApiViewModel.dart';
import 'package:provider/provider.dart';

class ApiView extends StatelessWidget {

  const ApiView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiViewModel>(context);
      return Scaffold(
        appBar: AppBar(
            title: const Text("http")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 응답 결과 count, age 표시
            SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  "이름 = ${provider.data!.name}\n추정 인원 = ${provider.data!.count}명\n추정 나이 = ${provider.data!.age}살",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Form 표시 (이름 입력 및 API 호출 버튼)
            _FormWidget(onSaved: provider.fetchAPI), // provider의 fetchAPI() 함수 전달
          ],
        ),
      );
  }
}

// 사용자로부터 이름을 입력 받는 Form 을 반환하는 위젯
class _FormWidget extends StatelessWidget {

  //  provider의 fetchAPI() 함수를 전달 받는 필드
  final Function(String) onSaved;

  _FormWidget({ required this.onSaved, super.key});

  // Form 상태(FormState)를 관리하는 Globalkey 생성
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey, // Form 에 GlobalKey (_formKey) 등록
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child:
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Input name",
                  ),
                  validator: (String? value) {
                    // 빈 문자열 검사
                    if (value == null || value.isEmpty) {
                      return "Please input name";
                    }
                    // 영문 입력 검사
                    final RegExp regExp = RegExp(
                        r"^[A-Za-z]+$"); // r : Raw String, 문자열 내의 모든 문자를 문자 그대로 사용(이스케이프 무시)
                    if (!regExp.hasMatch(value)) {
                      return "Please input name";
                    }
                    return null; // 유효성 검사 통과
                  },
                  onSaved: (String? value) {
                    onSaved(value!);
                  },
                ),
            ),
            SizedBox(width: 20),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  // 입력 테이터 검증 후 저장
                  if (_formkey.currentState!
                      .validate()) { // 입력 필드의 validator 콜백 호출
                    _formkey.currentState!.save(); // 입력 필드의 onSaved 콜백 호출
                  }
                },
                child: const Text("API 요청"),
              ),
            )
          ],
        )
    );
  }
}