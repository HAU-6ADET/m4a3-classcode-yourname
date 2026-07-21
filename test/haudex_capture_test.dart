// m4a3 - screenshot capture (teacher-canonical, NOT scored).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m4a3_styling_dex/type_style.dart';

import 'support/haudex_golden.dart';

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: type badges', (tester) async {
    await captureScreen(
      tester,
      Scaffold(
        appBar: AppBar(title: const Text('HAUDEX types')),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TypeBadge(type: 'fire'),
              SizedBox(height: 12),
              TypeBadge(type: 'water'),
              SizedBox(height: 12),
              TypeBadge(type: 'grass'),
            ],
          ),
        ),
      ),
      name: 'types',
    );
  });
}
