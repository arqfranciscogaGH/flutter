//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

// import 'package:firebase_core/firebase_core.dart';

//  librerias  proyecto

import 'configuracionAplicacion.dart';
import '../../nucleo/ui/ui.dart';
import '../contexto/contexto.dart';






class Inicio {
  Inicio.iniciar() {
    //  Firebase.initializeApp();
    Preferencias.iniciar();
    ContextoAplicacion.iniciar();
  }
}
