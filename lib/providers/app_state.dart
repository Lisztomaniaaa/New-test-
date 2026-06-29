import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  String? _apiKey;
  String _selectedModel = 'gpt-3.5-turbo';
  List<String> _availableModels = ['gpt-3.5-turbo', 'gpt-4'];

  String? get apiKey => _apiKey;
  String get selectedModel => _selectedModel;
  List<String> get availableModels => _availableModels;

  Future<void> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    _apiKey = prefs.getString('api_key');
    _selectedModel = prefs.getString('selected_model') ?? 'gpt-3.5-turbo';
    notifyListeners();
  }

  Future<bool> verifyAndSetApiKey(String key) async {
    // Basic mock verification. In a real app, you'd make a test API call.
    await Future.delayed(Duration(seconds: 1)); // Simulate network request
    if (key.length > 10) { // Simple mock validation
      _apiKey = key;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('api_key', key);
      notifyListeners();
      return true;
    }
    return false;
  }

  void setModel(String model) async {
    _selectedModel = model;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_model', model);
    notifyListeners();
  }
}
