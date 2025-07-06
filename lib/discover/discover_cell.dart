import 'package:flutter/material.dart';
import 'package:wechat_demo/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String imageName;
  final String? subImageName;

  DiscoverCell({
    required this.title,
    this.subTitle,
    required this.imageName,
    this.subImageName,
  }) : assert(title != null, 'title 不能为空！'),
        assert(imageName != null, 'imageName 不能为空！');

  @override
  State<StatefulWidget> createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DiscoverChildPage(
              title: widget.title,
            )));
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentColor = Colors.grey;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColor = Colors.white;
        });
      },
      child: Container(
        height: 55,
        color: _currentColor,
        child: Row(
          //主轴是spaceBetween
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  //图标
                  Image(image: AssetImage(widget.imageName),width: 20,),
                  //间距
                  SizedBox(width: 15,),
                  //Title
                  Text(widget.title),
                ],
              ),
            ),
            //right
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  // subTitle
                  widget.subTitle != null ? Text(widget.subTitle!) : Text(''),
                  // subImage
                  widget.subImageName != null ? Image.asset(widget.subImageName!,width: 15,) : Container(),
                  // 箭头
                  Image(image: AssetImage('images/icon_right.png'), width: 15,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
