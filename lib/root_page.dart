import 'package:flutter/material.dart';
import 'package:wechat_demo/chat_page.dart';
import 'package:wechat_demo/discover/discover_page.dart';
import 'package:wechat_demo/friends/friends_page.dart';
import 'package:wechat_demo/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 3;
  List <Widget> _pages = [ChatPage(),FirendsPage(),DiscoverPage(),MinePage()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12.0,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Image(
                width: 20,
                height: 20,
                image: AssetImage('images/tabbar_chat.png'),
              ),
              activeIcon: Image(
                width: 20,
                height: 20,
                image: AssetImage('images/tabbar_chat_hl.png')
              ),
              label: '微信'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: '通讯录'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: '发现'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '我'),
          ],
        ),
      ),
    );
  }
}
