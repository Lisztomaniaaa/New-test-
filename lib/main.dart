import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/app_state.dart';
import 'screens/auth_screen.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  await appState.loadSavedData();
<<<<<<< HEAD

=======

>>>>>>> b0a5eb8 (temp)
  runApp(
    ChangeNotifierProvider.value(
      value: appState,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat Sandbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Consumer<AppState>(
        builder: (context, appState, _) {
          if (appState.apiKey != null && appState.apiKey!.isNotEmpty) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
