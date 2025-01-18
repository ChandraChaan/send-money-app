import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:send_money_app/viewmodels/transaction_viewmodel.dart';

void main() {
  group('TransactionViewModel Tests', () {
    late TransactionViewModel transactionViewModel;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      transactionViewModel = TransactionViewModel();
    });

    test('initializeData should load wallet balance and transactions', () async {
      await transactionViewModel.initializeData();
      expect(transactionViewModel.walletBalance, 500.0);
      expect(transactionViewModel.transactions, []);
    });

    test('sendMoney should reduce wallet balance and add a transaction', () async {
      await transactionViewModel.initializeData();
      final initialBalance = transactionViewModel.walletBalance;

      await transactionViewModel.sendMoney(50.0);

      expect(transactionViewModel.walletBalance, initialBalance - 50.0);
      expect(transactionViewModel.transactions.length, 1);

      final transaction = transactionViewModel.transactions.first;
      expect(transaction['amount'], '₹50.0');
    });
  });
}