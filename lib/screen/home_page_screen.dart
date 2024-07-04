import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/crypto_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CryptoProvider>(context, listen: false)
          .showCryptoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF739EE8),
              Color(0xFF5D78E1),
              Color(0xFF5973DF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Consumer<CryptoProvider>(
                builder: (context, provider, child) {
                  return Expanded(
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("List Crypto",style: TextStyle(color: Colors.red,fontSize: 20),),
                            // Customize according to your needs
                          ],
                        ),

                        const SizedBox(height: 10),
                        provider.cryptoModel.data != null
                            ? Expanded(
                          child: ListView.builder(
                            itemCount: provider.cryptoModel.data!.length,
                            itemBuilder: (context, index) {
                              var cryptoData = provider.cryptoModel.data?[index];
                              return Card(
                                color: Colors.white,
                                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                child: ListTile(
                                  title: Text(
                                    cryptoData!.name.toString(), // Adjust the field name accordingly
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rank: ${cryptoData.rank.toString()}', // Adjust the field name accordingly
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            const WidgetSpan(
                                              child: Icon(
                                                Icons.attach_money,
                                                size: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            TextSpan(
                                              text: cryptoData.priceUsd.toString(), // Adjust the field name accordingly
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                            },
                          ),
                        )
                            : const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
