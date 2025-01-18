import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionViewModel extends ChangeNotifier {
  double _walletBalance = 500.0;
  List<Map<String, String>> _transactions = [];

  double get walletBalance => _walletBalance;
  List<Map<String, String>> get transactions => List.from(_transactions.reversed); // Reverse the list for recent transactions on top

  // Initialize data from local storage
  Future<void> initializeData() async {
    final prefs = await SharedPreferences.getInstance();
    _walletBalance = prefs.getDouble('walletBalance') ?? 500.0;
    final savedTransactions = prefs.getStringList('transactions') ?? [];
    _transactions = savedTransactions
        .map((t) => Map<String, String>.from(Map.fromEntries(t.split('|').map((e) {
      final parts = e.split(':');
      return MapEntry(parts[0], parts[1]);
    }))))
        .toList();
    notifyListeners();
  }

  // Save data to local storage
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('walletBalance', _walletBalance);
    await prefs.setStringList(
      'transactions',
      _transactions.map((t) => t.entries.map((e) => '${e.key}:${e.value}').join('|')).toList(),
    );
  }

  // Add a transaction
  Future<void> sendMoney(double amount) async {
    if (amount > _walletBalance) {
      throw Exception('Insufficient balance');
    }

    _walletBalance -= amount;
    final transaction = {
      'amount': '₹$amount',
      'date': DateTime.now().toIso8601String(),
    };
    _transactions.add(transaction);

    // Save locally
    await _saveData();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2)); // Replace with actual API call
    notifyListeners();
  }
}
