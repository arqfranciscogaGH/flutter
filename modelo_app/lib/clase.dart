//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto


class IdiomaAplicacion
{
  
}

class Accion {
  BuildContext context;
  dynamic argumentos;
  String otro="";
  static String _paginaActual="";
  static String paginaAnterior="";
  Accion({ required this.context, this.otro="a" , this.argumentos});
 void  ejecutarRuta() {
   print (this.otro);
   print (argumentos);
   print (_paginaActual);
   print (Accion.paginaAnterior);
  //  Vehicle car = new  Vehicle(make:"Honda",model:"Civic", manufactureYear:2010,color:"red", vehicleAge: 10);
 }
  static display() { 
      print("The car name is ${Accion.paginaAnterior}")  ; 
  } 
  String get paginaActual {
    return _paginaActual;
  }
  void set paginaActual (String paginaActual) {
    _paginaActual = paginaActual;
  }
   void set Eotro (String potro) {
    otro = potro;
  }
}
class Vehicle {
  String make="";
  String model;
  int manufactureYear;
  int vehicleAge;
  String color;



  Vehicle({this.make="",this.model="",this.manufactureYear=5,this.color="", required this.vehicleAge});
  int get age {
    return vehicleAge;
  }

  void set age(int currentYear) {
    vehicleAge = currentYear - manufactureYear;
    print (vehicleAge);
  }

  Map<String,dynamic> get map {
    return {
      "make": this.make,
      "model": model,
      "manufactureYear":manufactureYear,
      "color": color,
      "vehicleAge":vehicleAge,
    };
  }
}


