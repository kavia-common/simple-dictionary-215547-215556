import 'package:flutter_test/flutter_test.dart';
import 'package:dictionary_frontend/main.dart';

void main() {
  testWidgets('App renders SearchPage with app bar title', (tester) async {
    await tester.pumpWidget(const DictionaryApp());
    await tester.pumpAndSettle();

    expect(find.text('Ocean Dictionary'), findsWidgets);
  });
}
