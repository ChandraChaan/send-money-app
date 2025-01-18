import 'package:flutter/material.dart';
import 'package:send_money_app/screens/dashboard_screen.dart';
import 'package:send_money_app/screens/send_money_screen.dart';
import 'package:send_money_app/screens/transactions_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/send-money': (context) => SendMoneyScreen(),
        '/transactions': (context) => TransactionsScreen(),
      },
    );
  }
}