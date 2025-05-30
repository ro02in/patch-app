import 'package:flutter/material.dart';
import '../Model/trade_request_model.dart';
import '../Service/TradeRequestDTO.dart';
import '../Service/trade_request_service.dart';

class TradeProvider extends ChangeNotifier {
  final TradeService _tradeService = TradeService();

  List<TradeRequestModel> _receivedTrades = [];
  List<TradeRequestModel> _sentTrades = [];
  bool _isLoading = false;
  String? _error;

  List<TradeRequestModel> get receivedTrades => _receivedTrades;
  List<TradeRequestModel> get sentTrades => _sentTrades;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load received trades for a user
  Future<void> fetchReceivedTrades(String googleId) async {
    _setLoading(true);
    try {
      _receivedTrades = await _tradeService.getReceivedTrades(googleId);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  // Load sent trades for a user
  Future<void> fetchSentTrades(String googleId) async {
    _setLoading(true);
    try {
      _sentTrades = await _tradeService.getSentTrades(googleId);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  // Create a new trade request
  Future<TradeRequestModel?> createTrade(TradeRequestDTO tradeDTO) async {
    _setLoading(true);
    try {
      final trade = await _tradeService.createTrade(tradeDTO);
      // Optionally refresh lists or add new trade locally
      _error = null;
      _setLoading(false);
      return trade;
    } catch (e) {
      _error = e.toString();
      _setLoading(false);
      return null;
    }
  }

  // Respond to trade (accept/reject)
  Future<TradeRequestModel?> respondToTrade(int tradeId, String status) async {
    _setLoading(true);
    try {
      final trade = await _tradeService.respondToTrade(tradeId, status);
      _error = null;
      _setLoading(false);
      return trade;
    } catch (e) {
      _error = e.toString();
      _setLoading(false);
      return null;
    }
  }

  // Delete a trade
  Future<bool> deleteTrade(int tradeId) async {
    _setLoading(true);
    try {
      await _tradeService.deleteTrade(tradeId);
      _error = null;
      _setLoading(false);
      return true;
    } catch (e) {
      _error = e.toString();
      _setLoading(false);
      return false;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
