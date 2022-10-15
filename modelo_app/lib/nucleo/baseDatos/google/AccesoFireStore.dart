//  librerias internas de flutter

//  librerias importadas flutter

// import 'package:cloud_firestore/cloud_firestore.dart';

//  librerias  proyecto

import '../admin/IAccesoBD.dart';

class AccesoFireStore extends IAccesoBD {
  /*   // variables
  FirebaseFirestore _dbCloud = FirebaseFirestore.instance;
  String nombre="Persona";
  CollectionReference _refCloud;  


  //  propiedades

  // métodos
  AccesoFireStore()
  {
     
      _dbCloud = Firestore.instance;
 
  }  
   @override  
  iniciar() async {
      
  
      crear(configuracion.nombreBD);
  }     
  @override  
  abrir() async {

  }
  
  crear (String nombreTabla)
  {
      if (_refCloud==null)
        _refCloud = _dbCloud.collection(nombreTabla);  
  }
 
  @override  
  Future ejecutar(String sql) async {
    List   respuesta;  
    return respuesta;
  }
  @override   
  Future<List<dynamic>> consultar(String nombreTabla) async {
     QuerySnapshot  qs;
    List<DocumentSnapshot> lista;
    List<Map<dynamic, dynamic>> listmap = new List();
    qs =await _refCloud.getDocuments() ;
    lista=qs.documents;
    qs=null;
    listmap = lista.map((DocumentSnapshot docSnapshot){
          Map<String, dynamic> registro =docSnapshot.data();
          registro['llave']=docSnapshot.documentID;
          return registro;
    }).toList();
    //listmap = lista.map((DocumentSnapshot docSnapshot) => docSnapshot.data ).toList();
    return listmap; 
  }

  @override   
  Future<dynamic> obtener(String nombreTabla,Map<String, dynamic> map,String campo ,int id) async {

/*      String llave= map['llave'];
     print (llave);     
     DocumentSnapshot respuesta =await _refCloud.document(map['llave']).get();

     if (respuesta.data!=null)
     {
          map=respuesta.data;
          map['llave']=respuesta.documentID;
       
     }
   */
     return map;
  }  
  //Future<DocumentSnapshot> 
  @override    
  Future<dynamic> insertar(String nombreTabla,Map<String, dynamic> map) async {
     DocumentReference respuesta=await _refCloud.add(map);
     map['llave']=respuesta.documentID;  
     print (map['llave']);
     return map;       
  }

  @override    
  Future<dynamic> actualizar(String nombreTabla,Map<String, dynamic> map,String campo ,int id) async {
    String id=map['llave'];
    await _refCloud.document(id).updateData(map) ;
    return map;
  }

  @override    
  Future<Map<String,dynamic>> eliminar(String nombreTabla,Map<String, dynamic> map,String campo ,int id) async {
      String id=map["llave"]; 
      await _refCloud.document(id).delete();
      return map;
  }

   @override  
  Future<List<dynamic>> SQLConsultar(String sql) async {
    List   respuesta;  
    return respuesta;
  }
  @override    
  Future<dynamic> SQLinsertar(String sql) async {
    List   respuesta;  
    return respuesta;
  } 

  @override  
  Future<dynamic> SQLactualizar(String sql) async {
    List   respuesta;  
    return respuesta;
  }
  @override  
  Future<dynamic> SQLeliminar(String sql) async {
    List   respuesta;   
    return respuesta;
  }

  @override  
  void cerrar() {
      _dbCloud= null;  
      _refCloud = null;    
  } */

}
