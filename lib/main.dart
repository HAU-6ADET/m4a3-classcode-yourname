import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'type_style.dart';

// Entry point. Run it to preview your type badges. Your work goes in
// `type_style.dart`.
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const HaudexApp(),
    ),
  );
}

class HaudexApp extends StatelessWidget {
  const HaudexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: Scaffold(
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
    );
  }
}
