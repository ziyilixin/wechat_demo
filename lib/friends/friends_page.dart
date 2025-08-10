import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/discover/discover_child_page.dart';
import 'package:wechat_demo/friends/friends_data.dart';
import 'package:wechat_demo/friends/index_bar.dart';

class _FriendCell extends StatelessWidget {
  _FriendCell({
    this.imageUrl,
    required this.name,
    this.groupTitle,
    this.imageAssets,
  });

  final String? imageUrl;
  final String name;
  final String? groupTitle;
  final String? imageAssets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          height: groupTitle != null ? 30 : 0,
          color: WeChatThemeColor,
          child: groupTitle != null ? Text(groupTitle!,style:TextStyle(color: Colors.grey)) : null,
        ),//头部
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                    image: imageUrl != null
                        ? NetworkImage(imageUrl!)
                        : AssetImage(imageAssets ?? ''),
                  ),
                ),
              ), //图片
              Container(
                width: screenWidth(context) - 54,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 54,
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 0.5,
                      color: WeChatThemeColor,
                    ), //下划线
                  ],
                ),
              ), //昵称
            ],
          ),
        ),
      ],
    );
  }
}

class FirendsPage extends StatefulWidget {
  const FirendsPage({super.key});

  @override
  State<FirendsPage> createState() => _FirendsPageState();
}

class _FirendsPageState extends State<FirendsPage> {

  final List<Friends> _headerData = [
    Friends(imageAssets: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageAssets: 'images/群聊.png', name: '群聊'),
    Friends(imageAssets: 'images/标签.png', name: '标签'),
    Friends(imageAssets: 'images/公众号.png', name: '公众号'),
  ];

  final List<Friends> _listDatas = [];

  @override
  void initState() {
    super.initState();
    //创建数据
    _listDatas..addAll(datas);
    //排序
    _listDatas.sort((Friends a, Friends b) {
      return a.indexLetter!.compareTo(b.indexLetter!);
    });
    
  }
  
  Widget _itemForRow(BuildContext context, int index) {
    //显示头部4个Cell
    if (index < _headerData.length) {
      return _FriendCell(
        imageAssets: _headerData[index].imageAssets ?? '',
        name:_headerData[index].name ?? '',
        groupTitle: null, // 头部数据不需要分组标题
      );
    }
    //是否显示组名字
    bool _hiddenIndexLetter = index - 4 > 0 && _listDatas[index - 4].indexLetter == _listDatas[index - 5].indexLetter;
    return _FriendCell(
      imageUrl: _listDatas[index - 4].imageUrl,
      name: _listDatas[index - 4].name ?? '',
      groupTitle: _hiddenIndexLetter ? null : _listDatas[index - 4].indexLetter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(title: '添加朋友')));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage('images/icon_friends_add.png'),
                width: 25,
              ),
            ),
          ),
        ],
        backgroundColor: WeChatThemeColor,
        title: const Text('通讯录页面'),
      ),
      body: Stack(
        children: [
          Container(
            color: WeChatThemeColor,
            child: ListView.builder(itemBuilder: _itemForRow, itemCount: _listDatas.length + _headerData.length),
          ),
          IndexBar(),
        ],
      )
    );
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
