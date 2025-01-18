import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:send_money_app/viewmodels/login_viewmodel.dart';

// Generate mock navigator observer
@GenerateMocks([NavigatorObserver])
import 'login_viewmodel_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LoginViewModel Tests', () {
    late LoginViewModel loginViewModel;
    late MockNavigatorObserver mockNavigatorObserver;

    setUp(() {
      SharedPreferences.setMockInitialValues({}); // Mock SharedPreferences
      loginViewModel = LoginViewModel();
      mockNavigatorObserver = MockNavigatorObserver();
    });

    testWidgets('logout should update isLoggedIn to false and navigate to login screen',
            (WidgetTester tester) async {
          // Initialize LoginViewModel and log in
          await loginViewModel.login('user', 'pass');
          expect(loginViewModel.isLoggedIn, true);

          // Build MaterialApp with MockNavigatorObserver
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(),
              navigatorObservers: [mockNavigatorObserver],
            ),
          );

          // Stub the navigator for MockNavigatorObserver
          when(mockNavigatorObserver.navigator)
              .thenReturn(Navigator.of(tester.element(find.byType(Scaffold))));

          // Call logout and pass context
          await loginViewModel.logout(tester.element(find.byType(Scaffold)));

          // Verify navigation to login screen
          verify(mockNavigatorObserver.didPush(any, any)).called(1);
          expect(loginViewModel.isLoggedIn, false);
        });
  });
}