import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/trade_request_model.dart';
import '../Service/TradeRequestDTO.dart';

class TradeService {
  final String baseUrl = 'https://group-4-15.pvt.dsv.su.se/api/trades';

  // Create a new trade request
  Future<TradeRequestModel> createTrade(TradeRequestDTO tradeDTO) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(tradeDTO.toJson()),
    );

    if (response.statusCode == 200) {
      return TradeRequestModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create trade');
    }
  }

  // Get trades received by a user
  Future<List<TradeRequestModel>> getReceivedTrades(String googleId) async {
    final response = await http.get(Uri.parse('$baseUrl/received/trades?query=$googleId'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => TradeRequestModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load received trades');
    }
  }

  // Get trades sent by a user
  Future<List<TradeRequestModel>> getSentTrades(String googleId) async {
    final response = await http.get(Uri.parse('$baseUrl/sent/trades?query=$googleId'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => TradeRequestModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load sent trades');
    }
  }

  // Respond to a trade (accept or reject)
  Future<TradeRequestModel> respondToTrade(int tradeId, String status) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$tradeId/status?status=$status'),
    );

    if (response.statusCode == 200) {
      return TradeRequestModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to respond to trade');
    }
  }

  // Delete a trade
  Future<void> deleteTrade(int tradeId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$tradeId/delete'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete trade');
    }
  }

  // Test endpoint
  Future<String> getHello() async {
    final response = await http.get(Uri.parse('$baseUrl/hello'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get hello');
    }
  }
}
