import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test all page-specific Lottie asset parsing for milk animations', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset('assets/milk_can_animation.json', width: 100, height: 100),
                Lottie.asset('assets/milk_testing_animation.json', width: 100, height: 100),
                Lottie.asset('assets/services_maintenance_animation.json', width: 100, height: 100),
                Lottie.asset('assets/services_cloud_amcu_animation.json', width: 100, height: 100),
                Lottie.asset('assets/products_catalog_animation.json', width: 100, height: 100),
                Lottie.asset('assets/about_factory_animation.json', width: 100, height: 100),
                Lottie.asset('assets/contact_support_animation.json', width: 100, height: 100),
                Lottie.asset('assets/calculator_roi_animation.json', width: 100, height: 100),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
