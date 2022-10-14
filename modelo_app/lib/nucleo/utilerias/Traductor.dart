//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';



//  librerias importadas flutter
 import '../../nucleo/nucleo.dart';

//  librerias  proyecto
// import '../../../modelo/Control.dart';
// export '../../../modelo/Control.dart'; 


class Traductor
{
   static YamlMap   etiquetasMapa=YamlMap();
  
   static Future cargar () async
   {
      String rutaIdioma= 'assets/idiomas/${ParametrosSistema.idioma}.yaml';
      print  (rutaIdioma);
      //String  etiquetasYaml =  await rootBundle.loadString('assets/idiomas/es.yaml');
      String  etiquetasYaml =  await rootBundle.loadString(rutaIdioma);
      etiquetasMapa = loadYaml(etiquetasYaml);
   }
    static dynamic  obtenerSeccion ( String  pagina)
   { 
      dynamic valor;
      try
      {
         //  si  es  home.eqtiqueta podría ser asi
         //  var keys = nombre  .split(".");
         //  keys.foreach( (k) => traduccion  =  etiquetasMapa[k]);
         // return traduccion;

         valor= etiquetasMapa[pagina];        
         return  valor ;        
       } 
      catch( error){
             return  valor ;
      }
   }
 
   static dynamic  obtenerEtiquetaSeccion ( String  seccion,  String  etiqueta)
   { 
      dynamic valor;
      try
      {
         valor= etiquetasMapa[seccion][etiqueta];        
         valor ??= sustituirEtiqueta(etiqueta,valor);  
         return  valor ;        
       } 
      catch( error){
            return  sustituirEtiqueta(etiqueta,valor) ;  
      }
   }   
   static dynamic  obtenerAtrbutoSeccion ( String  seccion,  String  atributo)
   { 
      dynamic valor;
      try
      {
         valor= etiquetasMapa[seccion][atributo];        
         return  valor ;        
       } 
      catch( error){
         return  valor ;   
      }
   }   
   static dynamic  obtenerElemento ( String  seccion,  String  elemento)
   { 
      dynamic valorElemento;
      try
      {
         valorElemento= etiquetasMapa[seccion][elemento];        
         return  valorElemento ;        
       } 
      catch( error){
        return valorElemento;
      }
   }   
   static dynamic  obtenerEtiquetaElemento( dynamic  elemento,  String  atributo)
   { 
      dynamic valor;
      String etiqueta=elemento+':'+atributo;
      try
      {
         valor= elemento[atributo];       
         valor ??= sustituirEtiqueta(etiqueta,valor);    
         return valor ;
      } 
      catch( error){
          return  sustituirEtiqueta(etiqueta,valor)  ;
      }
   }    
    static dynamic  obtenerAtrbutoElemento( dynamic  elemento,  String  atributo)
   { 
      dynamic valor;
      try
      {
         valor= elemento[atributo];       
         return valor ;
      } 
      catch( error){
         return valor ;
      }
   }    
   static dynamic obtenerEtiquetaAtributo ( String  seccion,  String  elemento, String  atributo)
   { 
      dynamic valorElemento;
      dynamic valorAtributo;
      String etiqueta=seccion+':'+elemento+':'+atributo;
      try
      {
         valorElemento= obtenerElemento(seccion,elemento);  
         if (valorElemento!=null)
         {
              valorAtributo= valorElemento[atributo];   
              valorAtributo ??= sustituirEtiqueta(etiqueta,valorAtributo); 
         }
         else
           valorAtributo=  sustituirEtiqueta(etiqueta,valorElemento) ;
         return valorAtributo;
       } 
      catch( error){
             return  sustituirEtiqueta(etiqueta,valorElemento) ; 
      }
  }   
  static dynamic  obtenerAtrbuto( String  seccion,  String  elemento, String  atributo)
   { 
      dynamic valorElemento;
      dynamic valorAtributo;
      try
      {
         valorElemento= obtenerElemento(seccion,elemento);  
         if (valorElemento!=null)
            valorAtributo= valorElemento[atributo];   
         return valorAtributo;
       } 
      catch( error){
             return  valorAtributo ;
      }
   }    
  static String  sustituirEtiqueta(String llave, dynamic valor )
  {
        dynamic  resultado ='';
        if (valor==null)
        {
          if (ParametrosSistema.idioma=='es')
              resultado= "#$llave no existe:";
          else if (ParametrosSistema.idioma=='en')
              resultado= "#$llave no exist: "; 
          resultado= "¡$llave:";
        }
        else
          resultado=valor;
        return  resultado;   
   }


   //  estas lineas estan depreccadas
/*    static const LocalizationsDelegate<TraductorIdioma> delegate = _idiomaAplicacionDelegate();
   static TraductorIdioma obtener(BuildContext context,TraductorIdioma idioma) 
   {
      dynamic  idiomaRegreso =Localizations.of<TraductorIdioma>(context, TraductorIdioma);
       if (idioma!=null)
          idiomaRegreso =idioma;
      return idiomaRegreso;
    } */
  

}




/* class _idiomaAplicacionDelegate extends LocalizationsDelegate<TraductorIdioma> {

  const _idiomaAplicacionDelegate();
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return  ['en','es'].contains(locale.languageCode);
  }

  @override
  Future<TraductorIdioma> load(Locale locale)  async {
    // TODO: implement load
    var e= TraductorIdioma(locale.languageCode);
    await e.load();
    //return idiomaAplicacion( locale.languageCode);
    return e;
  }

  @override
  bool shouldReload(LocalizationsDelegate<TraductorIdioma> old) {
    // TODO: implement shouldReload
    return false;
  } 

} */