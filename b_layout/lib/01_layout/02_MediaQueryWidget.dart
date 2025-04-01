import 'package:flutter/material.dart';

// MediaQuery
// 디바이스의 화면 크기, 방향, 접근성 설정 등 다양한 미디어 정보를 제공하는 위젯입니다.
// 이를 통해서 반응형 UI를 쉽게 구현할 수 있습니다.
// 주요 속성
// 1. size : 화면의 크기
// 2. orientation : 화면의 방향 (portrait : 화면 세움(디폴트), landscape : 화면 눕힘)
// 3. padding : 화면의 내부 여백

class MediaQueryWidget extends StatelessWidget {

  const MediaQueryWidget({super.key});

  /*
  @override
  Widget build(BuildContext context) {

    // MediaQuery.of(BuildContext context)
    // 현재 BuildContext에 대한 MediaQueryData를 가져와서 화면의 다양한 속성에 접근할 수 있습니다.
    final mediaQuery = MediaQuery.of(context);

    // 화면 크기
    dynamic screenSize = mediaQuery.size;
    dynamic width = screenSize.width;
    dynamic height = screenSize.height;

    // 화면 패딩 (간단한 반응형)
    double padding = width > 600 ? 20.0 : 10.0;

    // 화면 방향
    var orientation = mediaQuery.orientation;

    // 화면 구성
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("width = $width, height = $height"),
        Padding(padding: EdgeInsets.all(padding)),
        orientation == Orientation.portrait ? const Text("화면 세움") : const Text("화면 눕힘"),
      ],
    );

  }
  */

  // 안전 구역 계산하기
  // 위 아래 여백을 제외한 높이 영역
  @override
  Widget build(BuildContext context) {

    var padding = MediaQuery.of(context).padding;
    var safeHeight = MediaQuery.of(context).size.height - padding.top - padding.bottom;

    return Container(
      height: safeHeight,
      child: Text("SafeHeight = $safeHeight", textAlign: TextAlign.center,),
    );

  }

}