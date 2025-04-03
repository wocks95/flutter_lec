import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {

  const SliderWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SliderState();

}

class _SliderState extends State<SliderWidget> {

  // 상태 변수
  double _score = 0.0; // initState() 메소드 호출 생략 가능

  // 상태 변수 변경
  void _setScore(double score) {
    setState(() {
      _score = score;
    });
  }

  // UI 빌드
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${_score.toInt()}"),
        Slider(
            min: 0,
            max: 100,
            value: _score,
            onChanged: (double? value) {
              _setScore(value!);
            }
        ),
      ],
    );
  }

}