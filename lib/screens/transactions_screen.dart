import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'amount': '₹200.00', 'date': '2025-01-15'},
    {'amount': '₹300.00', 'date': '2025-01-16'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: size.width * 0.07),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color:Colors.white, size: size.width * 0.07),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Expanded(
              child: transactions.isNotEmpty
                  ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.monetization_on, color: Colors.green, size: size.width * 0.07),
                      title: Text(
                        'Amount: ${transaction['amount']}',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'Date: ${transaction['date']}',
                        style: TextStyle(fontSize: size.width * 0.04, color: Colors.grey[700]),
                      ),
                    ),
                  );
                },
              )
                  : Center(
                child: Text(
                  'No Transactions Found',
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
