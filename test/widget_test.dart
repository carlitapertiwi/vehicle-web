import 'package:flutter_test/flutter_test.dart';

import 'package:kendaraan1/main.dart';

void main() {
  testWidgets('VehicleHub berjalan', (WidgetTester tester) async {
    await tester.pumpWidget(const VehicleHub());

    expect(find.text('VehicleHub'), findsOneWidget);
  });
}