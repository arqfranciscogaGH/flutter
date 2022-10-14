//  librerias internas de flutter

//  librerias importadas flutter

import '../../negocio/endidad/EntidadBase.dart';
import 'preferencias.dart';

//  librerias  proyecto

class Sesion {
  static int _idUsuario= 0;
  static String _nombre="";
  static String _cuenta="";
  static int _idSuscriptor = 0;
  static String _perfil="";
  static String _perfiles="";
  static String _grupo="";
  static String _grupos="";
  static String _nivelRed="";
  static String _version = '6.0';

  static String get version {
    if (_version == null || _version == '')
      _version = Preferencias.obtener("version", _version);
    return _version == null || _version == '' ? "" : _version;
  }

  static set version(String valor) {
    _version = valor;
    Preferencias.guardar("version", valor);
  }



  static String get nombre {
    if (_nombre == null || _nombre == '')
      _nombre = Preferencias.obtener("nombre", _nombre);
    return _nombre == null || _nombre == '' ? "" : _nombre;
  }

  static set nombre(String valor) {
    _nombre = valor;
    Preferencias.guardar("nombre", valor);
  }

  static String get cuenta {
    if (_cuenta == null || _cuenta == '')
      _cuenta = Preferencias.obtener("cuenta", _cuenta);
    return _cuenta == null || _cuenta == '' ? "" : _cuenta;
  }

  static set cuenta(String valor) {
    _cuenta = valor;
    Preferencias.guardar("cuenta", valor);
  }
  static int get idUsuario {
    if (_idUsuario == null || _idUsuario == 0)
      _idUsuario = Preferencias.obtener("idUsuario", _idUsuario);
    return _idUsuario == null || _idUsuario == 0 ? 0 : _idUsuario;
  }

 

  static set idUsuario(int valor) {
    _idUsuario = valor;
    Preferencias.guardar("idUsuario", valor);
  }
  static int get idSuscriptor {
    // _idSuscriptor == null ? 0 : _idSuscriptor;
    if (_idSuscriptor == null || _idSuscriptor == 0)
      _idSuscriptor = Preferencias.obtener("idSuscriptor", _idSuscriptor);
    return _idSuscriptor == null  || _idSuscriptor == 0  ? 0 : _idSuscriptor;
  }

  static set idSuscriptor(int valor) {
    _idSuscriptor = valor;
    Preferencias.guardar("idSuscriptor", valor);
  }

  static String get perfiles {
    if (_perfiles == null)
      _perfiles = Preferencias.obtener("perfiles", _perfiles);
    return _perfiles == null ? '' : _perfiles;
  }

  static String get perfil {
    if (_perfil == null)
      _perfil = Preferencias.obtener("perfil", _perfil);
    return _perfil == null ? '' : _perfil;
  }

  static set perfil(String valor) {
    _perfil = valor;
    Preferencias.guardar("perfil", valor);
  }

  static set perfiles(String valor) {
    _perfiles = valor;
    Preferencias.guardar("perfiles", valor);
  }

  static String get grupo {
    if (_grupo == null) _grupo = Preferencias.obtener("grupo", _grupo);
    return _grupo == null ? 0 : _grupo;
  }

  static set grupo(String valor) {
    _grupo = valor;
    Preferencias.guardar("grupo", valor);
  }
  static String get grupos {
    if (_grupos == null) _grupos = Preferencias.obtener("grupos", _grupos);
    return _grupos == null ? 0 : _grupos;
  }

  static set grupos(String valor) {
    _grupos = valor;
    Preferencias.guardar("grupos", valor);
  }

  static String get nivelRed {
    if (_nivelRed == null) _nivelRed = Preferencias.obtener("nivelRed", _nivelRed);
    return _nivelRed == null ? 0 : _nivelRed;
  }

  static set nivelRed(String valor) {
    _nivelRed = valor;
    Preferencias.guardar("nivelRed", valor);
  }
  
}
