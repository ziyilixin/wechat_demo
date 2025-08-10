import 'package:flutter/material.dart';
import '../const.dart';
import 'friends_page.dart';

class IndexBar extends StatefulWidget {
  @override
  State<IndexBar> createState() => _IndexBarState();
}

//获取选中的item的字符
String getIndex(BuildContext context,Offset globalPosition) {
  //拿到当前小部件的盒子
  RenderBox? renderBox = context.findRenderObject() as RenderBox?;
  if (renderBox != null) {
    //拿到y值，globalToLocal当前位置部件的原点(小部件左上角)的距离（x,y）
    double y = renderBox.globalToLocal(globalPosition).dy;
    //算出字符高度
    var itemHeight = screenHeight(context)/2/INDEX_WORDS.length;
    int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);
    return INDEX_WORDS[index];
  }
}

class _IndexBarState extends State<IndexBar> {
  Color _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> words = [];
    for (int i = 0;i < INDEX_WORDS.length;i++){
      words.add(
          Expanded(child: Text(INDEX_WORDS[i],style: TextStyle(fontSize: 10,color: _textColor),))
      );
    }
    return Positioned(
      right: 0.0,
      top: screenHeight(context)/8,
      height: screenHeight(context)/2,
      width: 30,
      child: GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails details) {
          String str = getIndex(context, details.globalPosition);
          print('选的是$str');
        },
        onVerticalDragDown: (DragDownDetails details) {
          setState(() {
            _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
            _textColor = Colors.white;
          });
        },
        onVerticalDragEnd: (DragEndDetails details) {
          setState(() {
            _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
            _textColor = Colors.black;
          });
        },
        child: Container(
          color: _bkColor,
          child: Column(
            children: words,
          ),
        ),
      ),
    );//悬浮的索引条
  }
}

