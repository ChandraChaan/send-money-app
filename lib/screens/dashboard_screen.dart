import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';
import '../viewmodels/transaction_viewmodel.dart';
import '../services/api_service.dart';
import '../models/transaction.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _showBalance = true;
  bool _isLoading = false;
  String _errorMessage = '';
  List<Transaction> _recentTransactions = [];

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final apiService = ApiService();
      final transactions = await apiService.fetchTransactions();
      setState(() {
        _recentTransactions = transactions.take(3).toList(); // Show top 3 transactions
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'No Internet Connection or Failed to Load Data';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final transactionViewModel = Provider.of<TransactionViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: size.width * 0.07,
            ),
            onPressed: () {
              Provider.of<LoginViewModel>(context, listen: false).logout(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 6,
                shadowColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet Balance',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _showBalance
                                ? '₹${transactionViewModel.walletBalance}'
                                : '******',
                            style: TextStyle(
                              fontSize: size.width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          _showBalance ? Icons.visibility_off : Icons.visibility,
                          size: size.width * 0.07,
                          color: Colors.indigo,
                        ),
                        onPressed: () {
                          setState(() {
                            _showBalance = !_showBalance;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/send-money'),
                icon: Icon(Icons.send, size: size.width * 0.06),
                label: Text(
                  'Send Money',
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/transactions'),
                icon: Icon(Icons.history, size: size.width * 0.06),
                label: Text(
                  'View Transactions',
                  style: TextStyle(fontSize: size.width * 0.045),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Note: These are sample API data fetched from the placeholder service.',
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else if (_errorMessage.isNotEmpty)
                Center(
                  child: Text(
                    _errorMessage,
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      color: Colors.red,
                    ),
                  ),
                )
              else
                ..._recentTransactions.map((transaction) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        'Amount: ${transaction.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text('Date: ${transaction.date}'),
                      leading: Icon(
                        Icons.monetization_on,
                        color: Colors.green,
                      ),
                    ),
                  );
                }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}