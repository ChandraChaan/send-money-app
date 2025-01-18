import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:send_money_app/main.dart';
import 'package:send_money_app/viewmodels/login_viewmodel.dart';

void main() {
  testWidgets('Login and navigation to Dashboard test', (WidgetTester tester) async {
    // Build the app with providers
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel()..initializeLoginStatus()),
        ],
        child: MyApp(),
      ),
    );

    // Wait for the UI to render
    await tester.pump(const Duration(seconds: 1));

    // Verify that we are on the login screen
    expect(find.text('Login'), findsOneWidget);

    // Ensure TextFields are present
    expect(find.byType(TextField), findsWidgets);

    // Enter credentials
    final usernameField = find.byType(TextField).at(0);
    final passwordField = find.byType(TextField).at(1);

    await tester.enterText(usernameField, 'user');
    await tester.enterText(passwordField, 'pass');

    // Tap the login button
    await tester.tap(find.text('Login'));
    await tester.pump(const Duration(seconds: 1));

    // Verify navigation to the Dashboard
    expect(find.text('Dashboard'), findsOneWidget);
  });

  testWidgets('Logout navigates back to login screen', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel()..initializeLoginStatus()),
        ],
        child: MyApp(),
      ),
    );

    // Ensure TextFields are present
    expect(find.byType(TextField), findsWidgets);

    // Perform login
    await tester.enterText(find.byType(TextField).at(0), 'user'); // Username field
    await tester.enterText(find.byType(TextField).at(1), 'pass'); // Password field
    await tester.tap(find.text('Login'));
    await tester.pump(const Duration(seconds: 1));

    // Verify we're on the dashboard
    expect(find.text('Dashboard'), findsOneWidget);

    // Tap logout button
    await tester.tap(find.byIcon(Icons.logout));
    await tester.pump(const Duration(seconds: 1));

    // Verify navigation back to login screen
    expect(find.text('Login'), findsOneWidget);
  });
}