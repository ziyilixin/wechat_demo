import 'package:flutter/material.dart';

class FirendsPage extends StatefulWidget {
  const FirendsPage({super.key});

  @override
  State<FirendsPage> createState() => _FirendsPageState();
}

class _FirendsPageState extends State<FirendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通讯录页面'),
      ),
      body: const Center(
        child: Text('通讯录页面'),
      ),
    );
  }
}
