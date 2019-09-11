import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_flutter/main.dart' as app;
void main() {
  testWidgets('MyWidget has a hello widget', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(app.Hello());


    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('MyWidget has no text saying Hello World', (WidgetTester tester) async {
    await tester.pumpWidget(app.MyApp());
    expect(find.text('Hello World'), findsNothing);
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

  testWidgets('Value doesnt increase beyond 10', (WidgetTester tester) async {
    await tester.pumpWidget(app.MyApp());
    for(int i=0; i<15; ++i) {
      await tester.tap(find.byKey(Key('incButton')));
    }
    await tester.pump();
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('Value doesnt decrease beyond 0', (WidgetTester tester) async {
    await tester.pumpWidget(app.MyApp());
    for(int i=0; i<15; ++i) {
      await tester.tap(find.byKey(Key('decButton')));
    }
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });
}