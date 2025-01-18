import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';
import '../viewmodels/transaction_viewmodel.dart';
import 'package:intl/intl.dart';

class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final transactionViewModel = Provider.of<TransactionViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white, size: size.width * 0.07),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout,
                color: Colors.white, size: size.width * 0.07),
            onPressed: () {
              Provider.of<LoginViewModel>(context, listen: false).logout(context);

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
              child: transactionViewModel.transactions.isNotEmpty
                  ? ListView.builder(
                      itemCount: transactionViewModel.transactions.length,
                      itemBuilder: (context, index) {
                        final transaction =
                            transactionViewModel.transactions[index];

                        // Parse and format date
                        final parsedDate = DateTime.parse(transaction['date']!);
                        final formattedDate = DateFormat('MMM dd, yyyy hh:mm a')
                            .format(parsedDate);

                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Icon(Icons.monetization_on,
                                color: Colors.green, size: size.width * 0.07),
                            title: Text(
                              'Amount: ${transaction['amount']}',
                              style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              'Date: $formattedDate',
                              style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  color: Colors.grey[700]),
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
