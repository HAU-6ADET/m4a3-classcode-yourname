// m4a3 - Styling the Dex: behaviour checks (canonical, overlaid onto clones).
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m4a3_styling_dex/type_style.dart';

Future<void> pumpBadge(WidgetTester tester, String type) async {
  await tester.pumpWidget(
    MaterialApp(home: Scaffold(body: Center(child: TypeBadge(type: type)))),
  );
}

void main() {
  test('student.json is filled in', () {
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }
  });

  group('colorForType', () {
    test('fire is a reddish colour', () {
      final c = colorForType('fire');
      expect(c.red > c.green && c.red > c.blue, isTrue,
          reason: 'fire should be dominated by the red channel.');
    });
    test('water is a bluish colour', () {
      final c = colorForType('water');
      expect(c.blue > c.red && c.blue > c.green, isTrue,
          reason: 'water should be dominated by the blue channel.');
    });
    test('grass is a greenish colour', () {
      final c = colorForType('grass');
      expect(c.green > c.red && c.green > c.blue, isTrue,
          reason: 'grass should be dominated by the green channel.');
    });
    test('the three type colours are all different', () {
      final set = {colorForType('fire').value, colorForType('water').value, colorForType('grass').value};
      expect(set.length, 3, reason: 'Give each type its own colour.');
    });
    test('an unknown type still returns a colour (a default)', () {
      expect(colorForType('mystery'), isA<Color>());
    });
  });

  group('TypeBadge', () {
    testWidgets('is a Container decorated with the type colour', (tester) async {
      await pumpBadge(tester, 'water');
      final container = tester.widgetList<Container>(find.byType(Container)).firstWhere(
            (c) => c.decoration is BoxDecoration && (c.decoration as BoxDecoration).color != null,
            orElse: () => throw TestFailure(
                'Use a Container with a BoxDecoration whose color is set.'),
          );
      final color = (container.decoration as BoxDecoration).color;
      expect(color, colorForType('water'),
          reason: 'The badge background should be colorForType(type).');
    });

    testWidgets('shows the type label in upper case', (tester) async {
      await pumpBadge(tester, 'fire');
      expect(find.text('FIRE'), findsOneWidget,
          reason: 'Show the type name in upper case, e.g. FIRE.');
    });

    testWidgets('uses white text so it reads on the colour', (tester) async {
      await pumpBadge(tester, 'grass');
      final label = tester.widget<Text>(find.text('GRASS'));
      expect(label.style?.color, Colors.white,
          reason: 'Give the label a white TextStyle color.');
    });
  });
}
