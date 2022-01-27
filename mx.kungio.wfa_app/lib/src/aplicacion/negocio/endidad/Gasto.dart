//  librerias internas de flutter
import 'dart:convert';
//  librerias importadas flutter

//  librerias  proyecto
import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Gasto extends EntidadBase {
  //    variables
  //    propiedades
  String tipo;
  String nombre;

  String categoria;
  int porcentaje;
  double importe = 0;
  String ruta = "DETALLEGASTO";
  String icono = "flip";
  String iconoLateral = "arrow_right";
  Function accion;
  String fecha;
  Gasto({
    id,
    this.nombre,
    this.tipo,
  }) : super(id: id, tabla: "Gasto");
  //    métodos
  factory Gasto.fromMap(Map<String, dynamic> json) => new Gasto(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
      );
  Gasto fromMap(Map<String, dynamic> json) => new Gasto(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
      };
  String toJson() => json.encode(this.toMap());
  Gasto fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Gasto> mapTolista(List<dynamic> listaMapa) {
    List<Gasto> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Gasto> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Gasto> lista = mapTolista(listaMap);
    return lista;
  }

  String sqlTabla() {
    String sql = "CREATE TABLE  if not exists " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "nombre TEXT , "
            "tipo TEXT )";
    return sql;
  }

  Gasto iniciar() {
    Gasto entidad = Gasto();
    entidad.nombre = "";
    entidad.tipo = "";
    entidad.importe = 0;
    return entidad;
  }

  void mostrar() {
    print("id: $id, nombre:$categoria, edad:$importe");
  }
}
