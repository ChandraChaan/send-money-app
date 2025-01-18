import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../viewmodels/login_viewmodel.dart';
import '../viewmodels/transaction_viewmodel.dart';
import '../widgets/bottom_sheet.dart';

class SendMoneyScreen extends StatefulWidget {
  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController _amountController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final transactionViewModel = Provider.of<TransactionViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send Money',
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
              Provider.of<LoginViewModel>(context, listen: false)
                  .logout(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enter the amount to send',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,2}')),
                    // Allows only numbers and optionally 2 decimal places
                  ],
                  decoration: InputDecoration(
                    labelText: 'Amount (₹)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.currency_rupee, color: Colors.indigo),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Available Balance: ₹${transactionViewModel.walletBalance.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                ElevatedButton(
                  onPressed: () async {
                    final amountText = _amountController.text;
                    if (amountText.isNotEmpty &&
                        double.tryParse(amountText) != null) {
                      final amount = double.parse(amountText);
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        await transactionViewModel.sendMoney(amount);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Transaction Successful!')),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Enter a valid amount')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: size.width * 0.045, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black45,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
