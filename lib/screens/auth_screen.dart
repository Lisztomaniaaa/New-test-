import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import 'chat_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _apiKeyController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _verifyApiKey() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final apiKey = _apiKeyController.text.trim();
    if (apiKey.isEmpty) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'API Key is required';
      });
      return;
    }

    try {
      final appState = Provider.of<AppState>(context, listen: false);
      final isValid = await appState.verifyAndSetApiKey(apiKey);
<<<<<<< HEAD

=======

>>>>>>> b0a5eb8 (temp)
      if (!mounted) return;

      if (isValid) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ChatScreen()),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid API Key';
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setup AI Chat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: InputDecoration(
                labelText: 'Enter API Key',
                border: OutlineInputBorder(),
                errorText: _errorMessage,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _verifyApiKey,
<<<<<<< HEAD
              child: _isLoading
                ? CircularProgressIndicator()
=======
              child: _isLoading
                ? CircularProgressIndicator()
>>>>>>> b0a5eb8 (temp)
                : Text('Verify & Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
