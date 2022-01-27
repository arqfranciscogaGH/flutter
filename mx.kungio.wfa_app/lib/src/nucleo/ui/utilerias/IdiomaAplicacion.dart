//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';



//  librerias importadas flutter


//  librerias  proyecto
// import '../../../modelo/Control.dart';
// export '../../../modelo/Control.dart'; 


class IdiomaAplicacion
{
   final String localName;
   YamlMap _etiquetasMapa ;

   IdiomaAplicacion( this.localName);
   static const LocalizationsDelegate<IdiomaAplicacion> delegate = _idiomaAplicacionDelegate();
   static IdiomaAplicacion obtener(BuildContext context,IdiomaAplicacion idioma) 
   {
      if (idioma==null)
          idioma = Localizations.of<IdiomaAplicacion>(context, IdiomaAplicacion);
      return idioma;
    }
   String get etiqueta
   {
      if (localName=='es')
        return "Hola paco";
      else if (localName=='en')
        return "hi frank";      
   }
   dynamic  obtenerPagina ( String  pagina)
   { 
      dynamic valorEtiqueta;
      try
      {

         //  si  es  home.eqtiqueta podría ser asi
         //  var keys = nombre  .split(".");
         //  keys.foreach( (k) => traduccion  =  etiquetasMapa[k]);
         // return traduccion;

          valorEtiqueta= _etiquetasMapa[pagina];        
         if (valorEtiqueta!=null)
            return valorEtiqueta;  
          else
             return  validarEtiqueta(etiqueta) ;        
       } 
      catch( error){
             return  validarEtiqueta(etiqueta)  ;
      }
   }      
   dynamic  obtenerElemento ( String  pagina,  String  elemento)
   { 
      dynamic valorElemento;
      try
      {

         //  si  es  home.eqtiqueta podría ser asi
         //  var keys = nombre  .split(".");
         //  keys.foreach( (k) => traduccion  =  etiquetasMapa[k]);
         // return traduccion;

          valorElemento= _etiquetasMapa[pagina][elemento];        
         if (valorElemento!=null)
            return valorElemento;  
          else
             return  validarEtiqueta(elemento) ;        
       } 
      catch( error){
             return  validarEtiqueta(elemento)  ;
      }
   }   
   dynamic  obtenerAtrbutoElemento( dynamic  elemento,  String  atributo)
   { 
      dynamic valorAtributo;
      try
      {
         if (elemento==null)
            return  validarEtiqueta(atributo) ; 
         valorAtributo= elemento[atributo];       
         if (valorAtributo!=null)
            return valorAtributo;  
          else
             return  null ;        
       } 
      catch( error){
             return  validarEtiqueta(atributo)  ;
      }
   }            
   dynamic  obtenerAtributo ( String  pagina,  String  elemento, String  atributo)
   { 
      dynamic valorElemento;
      dynamic valorAtributo;
      try
      {
         valorElemento= obtenerElemento(pagina,elemento);  
         if (valorElemento==null)
            return  validarEtiqueta(elemento) ; 
         valorAtributo= valorElemento[atributo];       
         if (valorAtributo!=null)
            return valorAtributo;  
          else
             return  validarEtiqueta(atributo) ;        
       } 
      catch( error){
             return  validarEtiqueta(atributo)  ;
      }
   }   
  
   
 
   String  validarEtiqueta(String etiqueta )
   {
        if (localName=='es')
             return "no existe  etiqueta: $etiqueta ";
        else if (localName=='en')
             return "no exist label: $etiqueta ";  
      }

   Future load () async
   {
        String  etiquetasYaml =  await rootBundle.loadString('assets/idiomas/${localName}.yaml');
        _etiquetasMapa = loadYaml(etiquetasYaml);
   }
}

class _idiomaAplicacionDelegate extends LocalizationsDelegate<IdiomaAplicacion> {

  const _idiomaAplicacionDelegate();
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return  ['en','es'].contains(locale.languageCode);
  }

  @override
  Future<IdiomaAplicacion> load(Locale locale)  async {
    // TODO: implement load
    var e= IdiomaAplicacion(locale.languageCode);
    await e.load();
    //return idiomaAplicacion( locale.languageCode);
    return e;
  }

  @override
  bool shouldReload(LocalizationsDelegate<IdiomaAplicacion> old) {
    // TODO: implement shouldReload
    return false;
  } 

}