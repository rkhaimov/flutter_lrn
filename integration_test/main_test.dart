import 'package:flutter_test/flutter_test.dart';
import 'package:lrn/main.dart' as app;

void main() {
  testWidgets('Golden test', (tester) async {
    await tester.pumpWidget(app.MyApp());

    await expectLater(
      find.byType(app.MyApp),
      matchesGoldenFile('./main.png'),
    );
  });
}
