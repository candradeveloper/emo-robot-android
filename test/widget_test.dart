import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:emo_robot/main.dart';

void main() {
  testWidgets('Aplikasi menampilkan judul Emo Robot', (WidgetTester tester) async {
    await tester.pumpWidget(const EmoRobotApp());

    expect(find.text('Emo Robot'), findsOneWidget);
  });

  testWidgets('Tombol pilih karakter dapat ditekan', (WidgetTester tester) async {
    await tester.pumpWidget(const EmoRobotApp());
    await tester.pumpAndSettle();

    final selectorButton = find.byIcon(Icons.person_outline);
    expect(selectorButton, findsOneWidget);

    await tester.tap(selectorButton);
    await tester.pumpAndSettle();

    expect(find.text('Pilih Karakter'), findsOneWidget);
  });
}
