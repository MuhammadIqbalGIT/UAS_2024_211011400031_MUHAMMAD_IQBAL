
import 'package:flutter/cupertino.dart';
import '../model/crypto_model.dart';
import '../services/crypto_service.dart';

class CryptoProvider extends ChangeNotifier {
  TextEditingController cityNameText = TextEditingController();

  CryptoService cryptoService = CryptoService();
  CryptoModel cryptoModel = CryptoModel();

  showCryptoList() async {
    cryptoModel = await cryptoService.getCryptoList();
    notifyListeners();
  }
}
