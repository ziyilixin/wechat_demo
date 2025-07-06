// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wechat_demo/main.dart';

void main() {
  testWidgets('WechatDemo app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    // Verify that the bottom navigation bar is displayed with correct labels.
    expect(find.text('微信'), findsOneWidget);
    expect(find.text('通讯录'), findsOneWidget);
    expect(find.text('发现'), findsOneWidget);
    expect(find.text('我'), findsOneWidget);
  });
}
