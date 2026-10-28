import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:little_drop_flutter/main.dart';

void main() {
  testWidgets('Little Drop app opens', (WidgetTester tester) async {
    await tester.pumpWidget(const LittleDropApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

