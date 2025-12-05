import 'package:flutter_test/flutter_test.dart';

import 'package:babosthapotro/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that our app starts.
    expect(find.text('Babosthapotro Home'), findsOneWidget);
  });
}
