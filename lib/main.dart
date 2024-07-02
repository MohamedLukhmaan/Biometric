import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  Future<bool> _authenticate() async {
    bool isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to access sensitive data',
        // authMessages:
        options: const AuthenticationOptions(
          biometricOnly: true,
        ));

    if (isAuthenticated) {
      // User is authenticated
      print('User is authenticated');
    } else {
      // User is not authenticated
      print('User is not authenticated');
    }

    return isAuthenticated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
