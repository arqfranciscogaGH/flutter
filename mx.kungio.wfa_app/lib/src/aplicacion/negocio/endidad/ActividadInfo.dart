//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class ActividadInfo extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;
  int idInstancia;
  int idTarea;
  int idActividad;
  String actividad;
  String estatus;
  String identificador;
  int cuenta;
  int importe;
  int tiempoMinimo;
  int tiempoMaximo;
  int productividadTiempo;
  int tiempoLimite;

  ActividadInfo({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    this.idInstancia,
    this.idTarea,
    this.idActividad,
    this.actividad,
    this.estatus,  
    this.identificador,    
    this.cuenta,
    this.importe,
    this.tiempoMinimo,  
    this.tiempoMaximo,    
    this.productividadTiempo,
    this.tiempoLimite, 

  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "Actividad");
  //    métodos

  factory ActividadInfo.fromMap(Map<String, dynamic> map) => new ActividadInfo(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],    
        idTarea : map['IdTarea'],     
        idInstancia : map['idInstancia'],
        idActividad : map['IdActividad'],
        actividad : map['Actividad'],
        estatus : map['Estatus'],   
        identificador : map['Identificador'],   
        cuenta : map['Cuenta'],          
        importe : map['Importe'],   
        tiempoMinimo : map['TiempoMinimo'],          
        tiempoMaximo : map['TiempoMaximo'],    
        productividadTiempo : map['ProductividadTiempo'],          
        tiempoLimite : map['TiempoLimite'],               
      );

  ActividadInfo fromMap(Map<String, dynamic> map) => new ActividadInfo(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],    
        idTarea : map['IdTarea'],     
        idInstancia : map['IdInstancia'],
        idActividad : map['IdActividad'],
        actividad : map['Actividad'],
        estatus : map['Estatus'],   
        identificador : map['Identificador'],   
        cuenta : map['Cuenta'],          
        importe : map['Importe'],   
        tiempoMinimo : map['TiempoMinimo'],          
        tiempoMaximo : map['TiempoMaximo'],    
        productividadTiempo : map['ProductividadTiempo'],          
        tiempoLimite : map['TiempoLimite'],        
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "Clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,       
        "IdInstancia": idInstancia,
        "IdTarea": idTarea,   
        "IdActividad": idActividad,
        "Actividad": actividad,  
        "Estatus": estatus,    
        "Identificador": identificador,  
        "Cuenta": cuenta,       
        "Importe": importe,       
        "TiempoMinimo": tiempoMinimo,  
        "TiempoMaximo": tiempoMaximo,                  
        "ProductividadTiempo": productividadTiempo,  
        "TiempoLimite": tiempoLimite,   

      };
         
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "idInstancia   INTEGER , "           
            "idTarea   INTEGER , "
            "idActividad    INTEGER , "
            "actividad   TEXT , "     
            "estatus   TEXT , "     
            "identificador   TEXT , "
            "cuenta   INTEGER, "
            "importe   INTEGER, "
            "tiempoMinimo   INTEGER, "
            "tiempoMaximo   INTEGER, "
            "productividadTiempo   INTEGER, "
            "tiempoLimite   INTEGER, "
            " )";
    return sql;
  }

  ActividadInfo iniciar() {
    ActividadInfo entidad = ActividadInfo();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.idInstancia = 0;   
    entidad.idTarea = 0;
    entidad.idActividad = 0;
    entidad.actividad = "";
    entidad.estatus = "";  
    entidad.identificador = "";       
    entidad.cuenta =  0;
    entidad.importe = 0;
    entidad.tiempoMinimo = 0;
    entidad.tiempoMaximo = 0;
    entidad.productividadTiempo = 0;
    entidad.tiempoLimite = 0;   
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  ActividadInfo fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<ActividadInfo> mapTolista(List<dynamic> listaMapa) {
    List<ActividadInfo> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<ActividadInfo> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<ActividadInfo> lista = mapTolista(listaMap);
    return lista;
  }
}
