import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key}); // 생성자

 @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.5, // 색깔이 들어간 상자(자식)의 가로세로비율
        ),
        children: [
          Card(color: Colors.cyan,),
          Card(color: Colors.purple,),
          Card(color: Colors.black12,),
          Card(color: Colors.yellow,),
          Card(color: Colors.cyan,),
          Card(color: Colors.purple,),
          Card(color: Colors.black12,),
          Card(color: Colors.yellow,),
        ],
    );
  }
}