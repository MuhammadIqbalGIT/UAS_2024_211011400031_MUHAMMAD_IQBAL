
import 'package:appcryptoiqbal/provider/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CryptoProvider>(
          create: (context) => CryptoProvider(),
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
