import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  CHAVE_PESO,
  CHAVE_ALTURA,
  CHAVE_IMC_RESULT,
}

class AppStorage {
  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setDoube(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  // outras funçoes

  Future<void> setPeso(double value) async {
    _setDoube(STORAGE_KEYS.CHAVE_PESO.toString(), value);
  }

  Future<double> getPeso() async {
    return _getDouble(STORAGE_KEYS.CHAVE_PESO.toString());
  }

  Future<void> setAltura(double value) async {
    _setDoube(STORAGE_KEYS.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getAltura() async {
    return _getDouble(STORAGE_KEYS.CHAVE_ALTURA.toString());
  }

  Future<void> setIMC(String value) async {
    _setString(STORAGE_KEYS.CHAVE_IMC_RESULT.toString(), value);
  }

  Future<String> getIMC() async {
    return _getString(STORAGE_KEYS.CHAVE_IMC_RESULT.toString());
  }
}
