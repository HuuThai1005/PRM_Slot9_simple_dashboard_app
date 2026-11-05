import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_dashboard_app/main.dart';

void main() {
  testWidgets('Open products and return to dashboard', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Hello, User 👋'), findsOneWidget);

    await tester.tap(find.text('Xem danh sách sản phẩm'));
    await tester.pumpAndSettle();

    expect(find.text('Products'), findsOneWidget);
    expect(find.text('Product #0'), findsOneWidget);
    expect(find.text('\$10.00'), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
