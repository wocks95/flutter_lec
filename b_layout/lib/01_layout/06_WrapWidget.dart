import 'package:flutter/cupertino.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //spacing: 20.0,
      //direction: Axis.vertical, // 수직 방향
                  // .horizontal, 수평 방향
      alignment: WrapAlignment.center, // 가운데
      children: [
        SizedBox(
          width: 200,
          child: Text("1st Text"),
        ),
        SizedBox(
          width: 200,
          child: Text("2nd Text"),
        ),
        SizedBox(
          width: 200,
          child: Text("3rd Text"),
        ),
        SizedBox(
          width: 200,
          child: Text("4th Text"),
        ),
      ],
    );
  }
}