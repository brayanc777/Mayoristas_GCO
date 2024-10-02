import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReceptionProvider extends ChangeNotifier {
  String? _sid;
  String? _caja;
  String? _nombreCentro;
  int? _idCentro;
  String? _codCentro;

  String? get sid => _sid;
  String? get caja => _caja;
  String? get nombreCentro => _nombreCentro;
  int? get idCentro => _idCentro;
  String? get codCentro => _codCentro;

  Future<void> _saveRegister() async {
    _sid = sid;
    _caja = caja;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sid', sid!);
    
    notifyListeners();
  }

  Future<void> seleccionarCentro(String nombreCentro, int idCentro, String codCentro) async {
    _nombreCentro = nombreCentro;
    _idCentro = idCentro;
    _codCentro = codCentro;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombreCentro', nombreCentro);
    await prefs.setInt('idCentro', idCentro);
    await prefs.setString('codCentro', codCentro);
    print(codCentro);

    notifyListeners();
  }
}
