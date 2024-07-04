

import 'package:dio/dio.dart';
import '../model/crypto_model.dart';

class CryptoService {
  final dio = Dio();

  Future<CryptoModel> getCryptoList() async {

    final responseApi = await dio.get(
        'https://api.coinlore.net/api/tickers/');
    print("test data iqbal${responseApi.requestOptions.path}");
    return CryptoModel.fromJson(responseApi.data);
  }
}
