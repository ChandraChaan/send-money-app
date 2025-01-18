import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/transaction.dart';
import '../screens/transactions_screen.dart';

class ApiService {
  final String baseUrl;

  ApiService({this.baseUrl = 'https://jsonplaceholder.typicode.com'});

  Future<List<Transaction>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transactions'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Transaction.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<bool> sendMoney(double amount) async {
    final response = await http.post(
      Uri.parse('$baseUrl/transactions'),
      body: json.encode({'amount': amount, 'date': DateTime.now().toString()}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}