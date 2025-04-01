import 'package:flutter/material.dart';

// SizedBox
// 고정된 크기를 가지는 박스를 만드는 위젯입니다.
// 위젯의 크기 고정 또는 위젯 사이 간격 조정할 때 주로 사용합니다.
// 주요 속성
// 1. width : 박스 너비
// 2. height : 박스 높이

// DecoratedBox
// SizedBox가 가지지 못한 테두리나 배경색 등을 지원하기 위한 위젯입니다.
// SizedBox의 자식 위젯으로 DecoratedBox 를 사용하면 됩니다.
// 주요 속성
// 1. color : 배경색
// 2. border : 테두리
// 3. borderRadius : 모서리 둥글기

class SizedBoxWidget extends StatelessWidget {

  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            width: 1.0,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(5),
        )
      ),
    );
  }

}