import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_flutter/main.dart' as app;
void main() {
  testWidgets('MyWidget has a hello widget', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(app.Hello());


    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('MyWidget has no text saying hello', (WidgetTester tester) async {
    await tester.pumpWidget(app.MyApp());
    expect(find.text('Hello'), findsNothing);
  });

  testWidgets('Value increases when "+" icon is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(app.MyApp());
    await tester.tap(find.byKey(Key('incButton')));
    await tester.pump();
//    tester.pumpAndSettle(Duration(milliseconds: 1000));
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Value decreases when "-" icon is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(app.MyApp());
    await tester.tap(find.byKey(Key('incButton')));
    await tester.tap(find.byKey(Key('incButton')));
    await tester.tap(find.byKey(Key('incButton')));
    await tester.tap(find.byKey(Key('decButton')));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
  });
}