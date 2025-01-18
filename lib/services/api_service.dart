import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class ApiService {
  final String baseUrl;

  ApiService({this.baseUrl = 'https://jsonplaceholder.typicode.com'});

  Future<List<Transaction>> fetchTransactions() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/todos'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((e) {
          return Transaction(
            amount: '₹${(100 + (e['id'] % 10) * 10).toStringAsFixed(2)}', // Mock amounts
            date: DateFormat('MMM dd, yyyy hh:mm a').format(
              DateTime.now().subtract(Duration(days: e['id'])),
            ), // Formatted date
          );
        }).toList();
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<bool> sendMoney(double amount) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/todos'),
        body: json.encode({'amount': amount, 'date': DateTime.now().toString()}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to send money');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}