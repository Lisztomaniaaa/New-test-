import 'package:flutter/material.dart';

class SandboxScreen extends StatefulWidget {
  @override
  _SandboxScreenState createState() => _SandboxScreenState();
}

class _SandboxScreenState extends State<SandboxScreen> {
  final TextEditingController _codeController = TextEditingController(
      text: "void main() {\n  print('Hello, Cloud Agent!');\n}");

  void _runCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Simulating code execution in Cloud Sandbox...')),
    );
  }

  void _saveRepo() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Changes saved to repository.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Agent Sandbox'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveRepo,
            tooltip: 'Save Repo',
          ),
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: _runCode,
            tooltip: 'Run Code',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _codeController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Write or edit repository code here...',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                style: TextStyle(
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
