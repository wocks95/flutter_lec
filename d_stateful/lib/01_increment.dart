import 'package:flutter/material.dart';

class IncrementButton extends StatelessWidget {

  // VoidCallback 타입
  // 1. 매개변수와 반환값이 모두 없는 함수 타입입니다.
  // 2. 현재 위젯을 사용하는 쪽에서 어떤 동작을 수행하는지 전달하면 해당 동작을 저장합니다.
  // 3. 부모 위젯이 자식 위젯의 이벤트에 반응할 수 있도록 해 주는 효과적인 콜백 패턴입니다.
  final VoidCallback onPressed;

  const IncrementButton({ required this.onPressed, super.key });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("+"),
    );
  }

}