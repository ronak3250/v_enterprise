import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:vinit_enterprise/main.dart';
import 'package:vinit_enterprise/providers/theme_provider.dart';

void main() {
  final widths = [360.0, 480.0, 600.0, 768.0, 900.0, 1024.0];

  for (final width in widths) {
    testWidgets('App renders without overflow at width $width', (WidgetTester tester) async {
      tester.view.physicalSize = Size(width, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: const VinitEnterpriseApp(),
        ),
      );
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(VinitEnterpriseApp), findsOneWidget);
    });
  }
}
