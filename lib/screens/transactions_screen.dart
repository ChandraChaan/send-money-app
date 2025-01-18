import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'amount': '₱200.00', 'date': '2025-01-15'},
    {'amount': '₱300.00', 'date': '2025-01-16'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Amount: ${transaction['amount']}'),
            subtitle: Text('Date: ${transaction['date']}'),
          );
        },
      ),
    );
  }
}