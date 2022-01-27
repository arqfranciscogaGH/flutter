import 'dart:async';

// import 'package:firebase_database/firebase_database.dart';

import '../../negocio/endidad/EntidadBase.dart';
import '../admin/IAccesoBD.dart';

class AccesoFireBase extends IAccesoBD {
/*     static DatabaseReference  instancia ;  
    static DatabaseReference  db ;          
    static DatabaseReference tabla ;
    static DataSnapshot registro;
    StreamSubscription<Event> _onAddedSubscription;
    StreamSubscription<Event> _onChangedSubscription;
  
    AccesoFireBase()
    {
        
        instancia = FirebaseDatabase.instance.reference();  
        
    }
    @override  
    iniciar() async {
        db = FirebaseDatabase.instance.reference().child(configuracion.nombreBD); 
    }   
    @override  
    abrir() async {
 
    }
    asignarMetodos(Function metodoAgregar ,Function metodoActualizar )
    {
        _onAddedSubscription = instancia.onChildAdded.listen(metodoAgregar);    
        _onChangedSubscription = instancia.onChildChanged.listen(metodoActualizar);     
    }
   @override   
   Future<List<dynamic>> consultar(String nombreTabla) async
   {


        DataSnapshot respuesta;
         tabla = db.reference().child(nombreTabla);
         respuesta = await db.child(nombreTabla).once();

          //  var keys =respuesta.value.keys;
           var vals =respuesta.value;
          //  print(keys);  
           print(vals);   
           for (var  valor in vals){
          
                      print(valor);
                      if (valor!=null) 
                      {
                          print(valor['nombre']);  
        
                      }
             }                                  
/*            for (var  key in keys){
     
                print(key);
                if (key!=null) 
                {
                    print(vals[key]);  
                    print(vals[key]['nombre']);  
                }
          }    */
          //  print(respuesta.value.map().toList());   
        db.reference().child(nombreTabla)   
        .orderByChild('id')
        .limitToFirst(10)
        .once()
        .then( (DataSnapshot respuesta)
         {
              var keys =respuesta.value.keys;
              vals =respuesta.value;
              print(keys);  
              print(vals);   
              //print(respuesta.value.asMap().toList());                     
              for (var  key in keys){
        
                    print(key);
                    if (key!=null) 
                    {
                        print(vals[key]['nombre']);  
                    }
              }   
/*          Map map = respuesta.value.asMap();
            map.forEach((key, val) {
              if (val!=null) 
              {
                 print( map.keys); 
                 print( map.values);                  
                 print(key);  
                 print(val);  
                 print(val['key']);   
                 print(val['nombre']);    
                
              }                
            });    */  
         });
/*         print (respuesta.value.elementAt(0));  
     
        print (respuesta.value.elementAt(1)["nombre"]);
        print (respuesta.value.elementAt(1)['direccion']); */
 
  
/*             List <dynamic> valores=respuesta.value;
            Map map = valores.asMap();
            map.forEach((key, val) {
              if (val!=null) 
              {
                 print(key);  
                 print(val);  
 
              }                
            });
            print( map['key']);  
            print (map['nombre']);                                     
            print (map['value']);   */

/*             valores.forEach((value){
              print('V $value');
              if (value!=null) 
              {
                  Map<dynamic, dynamic> ele=value;
                  dynamic valor=value;
                  print(' $ele');
  
                  print( ele['key']); 
                                     
                  print (ele['nombre']);                     
                                  
                  print (ele['value']);                     
                                       
              }              
            }); */

/*             for (var  registro in respuesta.value){
                //     print(valor['key']);  
                print(registro);
                if (registro!=null) 
                {
                    //print(registro.key);  
                    print(registro['value']);  
                    print(registro['key']);  
        
                    var sep= registro.toString().split(':') ;  
                    print(sep[0].toString().substring(2));  

                }  
            }   */
             

            
      return [];
   }
  @override   
  Future<dynamic> obtener(String nombreTabla,Map<String, dynamic> map,String campo ,int id) async {
      String id=map["id"].toString();
      tabla = db.child(nombreTabla);  
      DataSnapshot   datos ;
      datos = await tabla.child(id).once();
      return map;    
  }         
  @override    
  Future<dynamic> insertar(String nombreTabla,Map<String, dynamic> map) async {
      String id=map["id"].toString();
      tabla = db.child(nombreTabla);   
      tabla.child(id).push().reference().set(map);
      //tabla.push().reference().set(map);
      return map;    
  }
  @override    
  Future<dynamic> actualizar(String nombreTabla,Map<String, dynamic> map,String campo ,int id) async {
      String id=map["id"].toString();
      tabla = db.child(nombreTabla);  
      tabla.child(id).update(map);  
      
    return map;
  }

  @override    
  Future<Map<String,dynamic>> eliminar(String nombreTabla,Map<String, dynamic> map,String campo ,int id) async {
      String id=map["id"].toString();
      tabla = db.child(nombreTabla);  
      tabla.child(id).remove();     
      return map; 
  }
  */

}
