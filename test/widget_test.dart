// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
<<<<<<< HEAD

import 'package:ai_chat_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
=======
import 'package:provider/provider.dart';

import 'package:ai_chat_app/main.dart';
import 'package:ai_chat_app/providers/app_state.dart';

void main() {
  testWidgets('AuthScreen shows initially', (WidgetTester tester) async {
    final appState = AppState();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: appState,
        child: MyApp(),
      ),
    );

    // Verify that the AuthScreen is displayed.
    expect(find.text('Setup AI Chat'), findsOneWidget);
    expect(find.text('Enter API Key'), findsOneWidget);
>>>>>>> b0a5eb8 (temp)
  });
}
