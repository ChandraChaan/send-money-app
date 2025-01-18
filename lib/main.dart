import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_money_app/screens/dashboard_screen.dart';
import 'package:send_money_app/screens/send_money_screen.dart';
import 'package:send_money_app/screens/transactions_screen.dart';
import 'package:send_money_app/viewmodels/transaction_viewmodel.dart';
import 'package:send_money_app/viewmodels/login_viewmodel.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionViewModel()..initializeData()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()..initializeLoginStatus()),
      ],
      child: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) {
          return MaterialApp(
            title: 'Send Money App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: loginViewModel.isLoggedIn ? '/dashboard' : '/',
            routes: {
              '/': (context) => LoginScreen(),
              '/dashboard': (context) => DashboardScreen(),
              '/send-money': (context) => SendMoneyScreen(),
              '/transactions': (context) => TransactionsScreen(),
            },
          );
        },
      ),
    );
  }
}
