class DefininicionEstadisticas
{
  static String generarArgumentos(String vista,String idPerfil,String idGrupo,int idSocio, String idSeleccionado )
  {
   String argumentos="";
   String _idSocio=idSocio==null?"":idSocio.toString();
   argumentos+=definirVista(vista);
   argumentos+=definirFiltroPorPerfil(idPerfil,idGrupo,_idSocio);
   argumentos+=definirFiltroPorVistaElementoSeleccionado(vista,idSeleccionado);
   argumentos=argumentos==null  || argumentos=="" ?"''":argumentos; 
   return argumentos;
  }
  static String definirVista(String vista)
  {
    String argumentos="";
    if (vista.toLowerCase()=="tarea"  )
        argumentos ="vista=1";
    else if (vista.toLowerCase()=="grupo" ) 
        argumentos ="vista=2";
    else if (vista.toLowerCase()=="socio" ) 
        argumentos ="vista=3";
    return argumentos;
  }

  static String definirFiltroPorPerfil(String idPerfil,String idGrupo,String idSocio)
  {
    String argumentos="";
    if (idPerfil ==null ||  idPerfil =="" ||  idPerfil.toLowerCase()=="1"  )       // Administrador
        argumentos ="";
    else if (idPerfil.toLowerCase()=="2" )   // Lider  Socio
        argumentos = " ,IdGrupo="+idGrupo;
    else if (idPerfil.toLowerCase()=="3" )   // Socio
        argumentos =" ,IdSocio="+idSocio;
    return argumentos;  
  }
  static String definirFiltroPorVistaElementoSeleccionado(String vista, String idSeleccionado)
  {
    String argumentos="";
    if (idSeleccionado!="")
    {
      if (vista.toLowerCase()=="tarea"  )
          argumentos =" ,IdTarea="+idSeleccionado;
      else if (vista.toLowerCase()=="grupo" ) 
          argumentos =" ,IdGrupo="+idSeleccionado;
      else if (vista.toLowerCase()=="socio" ) 
          argumentos =" ,IdSocio="+idSeleccionado;
    }

    return argumentos;
  }
}