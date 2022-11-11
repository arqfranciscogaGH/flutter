//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias importadas flutter
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

//  librerias  proyecto

import '../nucleo/nucleo.dart';
import '../administracion/administracion.dart';

import '../../../nucleo/baseDatos/baseDatos.dart';

import '../aplicacion/negocio/modelo/ModeloAplicacion.dart';
export '../aplicacion/negocio/modelo/ModeloAplicacion.dart';

import '../aplicacion/contexto/ContextoAplicacion.dart';

import '../aplicacion/negocio/controladorEstado/ClienteCE.dart';

//  librerias externas  flutter

import '../paquetesExternos/paquetesExternos.dart';

// Descripcion de funcionalidad
//
//  Inicializacion variables
//

class InicializacionVariables {
  static void iniciar() async {
    valoresSincronos();
    await valoresAsicronos();
  }

  static void valoresSincronos() {
    late ElementoLista elementoLista;
    elementoLista = ElementoLista();
    elementoLista.titulo = "fga";
    InjeccionDependencia.agregar<ElementoLista>(elementoLista);
    //     ContextoAplicacion.iniciar();
  }

  static Future valoresAsicronos() async {
    AdministradorIdioma.obtenerIdioma();
    // Inicializar datos  formateo e  idioma ,  con esta linea  se  evita  error
    initializeDateFormatting(ParametrosSistema.idioma);
    Intl.defaultLocale = ParametrosSistema.idioma;

    AdministradorTema.obtenerTema();
    AdministradorSesion.obtener();
    await Traductor.cargar();

    int numero = 10;
    Preferencias.guardar("numero", numero);
    print(Preferencias.obtener("numero", numero));

    await _verEntidad();
  }

  static AccesoTabla<T> agregarTabla<T extends EntidadBase>(
      T entidad, ConfiguracionAccesoBD configuracion) {
    if (configuracion.tablas == null) configuracion.tablas = [];
    configuracion.tablas!.add(entidad);
    return AccesoTabla<T>(claseEntidad: entidad, configuracion: configuracion);
  }

  void respuestaSeleccionar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {}
  void respuestaConsultar(dynamic resouesta) {}
  static _verEntidad() async {
    // declarar  variables
    // declarar configuracion

    //  ConfiguracionAccesoBD configuracionPersitenciaMemoria =
    //       ConfiguracionAccesoBD(
    //     persitencia: ePersitencia.Memoria,
    //     tipoDB: eTipoDB.Ninguna,
    //     nombreBD: '',
    //     version: 1,
    //     persitenciaPorDefecto: false,
    //     contadorRegistros: true,
    //     dominioApi: '',
    //     sincronizarServidor: true,
    //   );

    // ConfiguracionAccesoBD _configuracionPersitenciaSqlLite =
    //         ConfiguracionAccesoBD(
    //       persitencia: ePersitencia.BaseDatos,
    //       tipoDB: eTipoDB.SQLLITE,
    //       nombreBD: 'prueba',
    //       version: 1,
    //       persitenciaPorDefecto: true,
    //       contadorRegistros: false,
    //       dominioApi: '',
    //       sincronizarServidor: true,
    //     );

    //   ConfiguracionAccesoBD configuracionPersitenciaApiControlConsecutivos = ConfiguracionAccesoBD(
    //     persitencia: ePersitencia.ApiREST,
    //     tipoDB: eTipoDB.Ninguna,
    //     nombreBD: '',
    //     version: 1,
    //     persitenciaPorDefecto: false,
    //     contadorRegistros: true,
    //    // dominioApi: 'arqfranciscoga-002-site3.btempurl.com',
    //     dominioApi: 'kungio.com',
    //     sitioApi:'/api/',
    //     llaveApi:'prueba',
    //     sincronizarServidor: true,
    //   );
    //   ConfiguracionAccesoBD configuracionPersitenciaApiIdentity =
    //       ConfiguracionAccesoBD(
    //     persitencia: ePersitencia.ApiREST,
    //     tipoDB: eTipoDB.Ninguna,
    //     nombreBD: '',
    //     version: 1,
    //     persitenciaPorDefecto: false,
    //     contadorRegistros: false,
    //    // dominioApi: 'arqfranciscoga-002-site3.btempurl.com',
    //     dominioApi: 'kungio.com',
    //     sitioApi:'/api/',
    //     llaveApi:'prueba',
    //     sincronizarServidor: true,
    //   );

    //   ConfiguracionAccesoBD configuracionApiParametros = ConfiguracionAccesoBD(
    //     persitencia: ePersitencia.ApiREST,
    //     tipoDB: eTipoDB.Ninguna,
    //     nombreBD: '',
    //     version: 1,
    //     persitenciaPorDefecto: false,
    //     contadorRegistros: false,
    //    // dominioApi: 'arqfranciscoga-002-site3.btempurl.com',
    //     dominioApi: 'kungio.com',
    //     sitioApi:'/api/',
    //     llaveApi:'prueba',
    //     sincronizarServidor: true,
    //   );

    //   ConfiguracionAccesoBD configuracionPersitenciaFireBase =
    //       ConfiguracionAccesoBD(
    //     persitencia: ePersitencia.NoSQLBaseDatos,
    //     tipoDB: eTipoDB.FireStore,
    //     nombreBD: 'prueba',
    //     version: 1,
    //     persitenciaPorDefecto: false,
    //     contadorRegistros: true,
    //     dominioApi: '',
    //     sincronizarServidor: true,
    //   );

    // declarar entidades

    ContextoAplicacion.iniciar();
    ClienteCE prov = ClienteCE();
    //Function metodo=respuestaConsultar;
    await prov.consultarEntidad(Cliente());

    Venta v = Venta().iniciar();
    v.nombre = 'fga';

    await ContextoAplicacion.db.tablaVenta!
        .insertar(v)
        .then((respuesta) => {print(respuesta)});

    await ContextoAplicacion.db.tablaVenta!
        .consultarTabla(ContextoAplicacion.db.tablaVenta!.entidad)
        .then((respuesta) => {print(respuesta)});

    // print(ContextoAplicacion.db.tablaCliente!.lista.length);
    // print(ContextoAplicacion.db.tablaVenta!.lista.length);

    // AccesoTabla<EntidadBase>? tablaModelo;
    // AccesoTabla<EntidadBase>? tablaModelo2;

    // EntidadBase eb = EntidadBase();
    // eb = EntidadBase( campoLLave: 'id' ,  nombreTabla: 'EntidadBase', nombre: 'hola');
    // eb =eb.iniciar();
    // eb.id=1;
    // eb.nombre='fga';

    // _db = DBAplicacion(_configuracionPersitencia);

    // if (configuracionPersitenciaMemoria.tablas == null)
    //    configuracionPersitenciaMemoria.tablas = [];

    //   configuracionPersitenciaMemoria.tablas!.add(eb,);

    // tabla =  AccesoTabla<EntidadBase>(claseEntidad: eb, nombreTabla:'prueba' , campoLLave: 'id'  ,tipoEntidad: eTipoEntidad.json , configuracion: configuracionPersitenciaMemoria);

    //  tablaModelo = agregarTabla<EntidadBase>( eb  ,configuracionPersitenciaMemoria);
    //  tablaModelo2 = agregarTabla<EntidadBase>( eb  ,_configuracionPersitenciaSqlLite);

    // AccesoBD? _accesoDB  = AccesoBD.instancia;
    // await ContextoAplicacion.db.abrir();
    // // await ContextoAplicacion.db.accesoDB.abrir();
    // await AdministradorAcceso.abrir();

    // _accesoDB.definirPersistencia(_configuracionPersitencia);
    // await  _accesoDB.abrir();

    // ContextoAplicacion.iniciar();

    //  entidad  - map

    // Map<String, dynamic> map;
    // map=eb.toMap();
    // map["nombre"]="cambio map ";
    // eb.fromMap(map);

    // map =tabla.entidad.toMap();
    // tabla.entidad.fromMap(map);

    // dynamic map1 =tabla.entidad;
    // dynamic map2 =tabla.entidad;

    // //  entidad  - json
    // eb.clave='Json';
    // String cadenaJson =eb.toJson();
    // eb.clave='';
    // eb.fromJson(cadenaJson);

    //   asignacion de entidades , datos y  lista por  fuera

    // print( tabla.registro.datos );
    // tabla.entidad.nombre="cambio II";
    // tabla.registro.datos=map;
    // tabla.entidad=eb;
    // print( tabla.registro.datos );
    // print( tabla.entidad.nombre );
    // print( tabla.registro.datos["nombre"] );

    // tabla.registro.datos=map;
    // print( tabla.registro.datos );
    // print( tabla.entidad.nombre );
    // print( tabla.registro.datos["nombre"] );

    //  cambiar datos  de  entidad, registro y  tabla

    // tabla.registro.datos["nombre"]="cambio III";
    // tabla.registro.c("nombre", "tercero ");

    // obtener datos  datos  de  entidad , y registro y  tabla

    // print (map["nombre"]);
    // print( tabla.registro.datos["nombre"] );
    // print( tabla.registro.o("nombre")) ;
    // print( tabla.registro.oid) ;

    //  asignar  lista  entidad

    // print(tabla.lista.length);
    // print(tabla.tabla.datos.length);

    // List<EntidadBase> lista_entidad =[];
    // lista_entidad.add(eb);

    // tabla.lista=lista_entidad;

    // print(tabla.lista.length);

    // print(tabla.tabla.datos.length);

    //  lista  map  texto

    // List<Map<String,dynamic>> lista_mapa=[];

    // lista_mapa.add(map);
    // lista_mapa.add( {
    //                   "id": 2,
    //                   "llave":  "",
    //                   "clave": "" ,
    //                   "nombre": "nuevo" ,
    //                   "descripcion": "" ,
    //                   "tabla":  ""
    //                 }
    // );

    // tabla.tabla.datos=lista_mapa;

    // print(tabla.lista.length);

    // print(tabla.tabla.datos.length);

    // print(tabla.tabla.datos);
    // print ( tabla.registro.datos);
    // print (lista_mapa);

    // dynamic b=lista_mapa.firstWhere((o) => o['nombre']=="nuevo");
    // b=tabla.tabla.datos.firstWhere((o) => o["nombre"]=="nuevo");
    // print (b);

    // dynamic d=tabla.lista.firstWhere((o) => o.nombre=="nuevo");

    // // print (d.nombre );

    // //  acceso a listas

    // List<Map<String,dynamic>> c=lista_entidad.map((c) => c.toMap()).toList();
    // print (c);
    // c=tabla.lista.map((c) => c.toMap()).toList();
    // print (c);

    // print(tablaModelo.lista.length);
    // print(tablaModelo.tabla.datos.length);
    // print(tablaModelo.tabla.datos);
    // print ( tablaModelo.registro.datos);

    //  await  tablaModelo.consultarTabla(tablaModelo.entidad).then((respuesta) =>{
    //     print ( respuesta)
    //   });

    // print(tablaModelo.lista.length);
    // print(tablaModelo.tabla.datos.length);
    // print(tablaModelo.tabla.datos);
    // print ( tablaModelo.registro.datos);

    // await tablaModelo.consultarTabla(tablaModelo.entidad).then((respuesta) =>{
    //     print ( respuesta)
    // });

    // agregar  elementos
    //   EntidadBase uno=EntidadBase(nombre: 'uno').iniciar();
    // //  uno.id=2;
    //   uno.nombre='uno';
    //   EntidadBase dos=EntidadBase(nombre: 'dos').iniciar();
    //   // dos.id=3;
    //   dos.nombre='dos';
    //   EntidadBase tres=EntidadBase(nombre: 'tres');
    //  tres.id=4;
    //   tres.nombre='tres';

    // tabla.lista.add(dos);
    // tabla.lista.add(tres);

    // //  memoria
    //   await tablaModelo.insertar(uno).then((respuesta) =>{
    //       print ( respuesta)
    //   });
    //  await  tablaModelo.consultarTabla(tablaModelo.entidad).then((respuesta) =>{
    //     print ( respuesta)
    //   });
    //   await  tablaModelo.insertar(dos).then((respuesta) =>{
    //       print ( respuesta)
    //   });
    //  await  tablaModelo.consultarTabla(tablaModelo.entidad).then((respuesta) =>{
    //     print ( respuesta)
    //   });
    //   await tablaModelo.insertar(tres).then((respuesta) =>{
    //       print ( respuesta)
    //   });

    //  await  tablaModelo.consultarTabla(tablaModelo.entidad).then((respuesta) =>{
    //     print ( respuesta)
    //   });

    //   print(tablaModelo.lista.length);
    //   print(tablaModelo.tabla.datos.length);
    //   print(tablaModelo.tabla.datos);
    //   print ( tablaModelo.registro.datos);

    //  dynamic x=tablaModelo.lista.firstWhere((o) => o.nombre.toString().contains("dos"));
    // // dynamic y=tabla.lista.firstWhere((o) => o.nombre=="tres");

    // print (x. nombre);
    // // print (y);
    // dos.nombre="dosfga";
    // await tablaModelo.actualizar(dos).then((respuesta) =>{
    //       print ( respuesta)
    // });
    // await tablaModelo.eliminar(tres).then((respuesta) =>{
    //       print ( respuesta)
    // });

    // await  tablaModelo2.consultarTabla(tablaModelo2.entidad).then((respuesta) =>{
    //       print ( respuesta)
    // });
    // uno.id=null;
    // await tablaModelo2.insertar(uno).then((respuesta) =>{
    //     print ( respuesta)
    // });
    // dos.id=null;
    // await tablaModelo2.insertar(dos).then((respuesta) =>{
    //     print ( respuesta)
    // });
    // await  tablaModelo2.consultarTabla(tablaModelo2.entidad).then((respuesta) =>{
    //       print ( respuesta)
    // });
    // print(tablaModelo2.lista.length);
    // print(tablaModelo2.tabla.datos.length);
    // print(tablaModelo2.tabla.datos);
    // print ( tablaModelo2.registro.datos);

    // tabla.consultarTabla(tabla.entidad).then((respuesta) =>{
    //       print ( respuesta)
    // });

    // print(tablaModelo.lista.length);
    // print(tablaModelo.tabla.datos.length);
    // print(tablaModelo.tabla.datos);
    // print ( tablaModelo.registro.datos);

    // print(  tabla.tabla.datos[0]["nombre"] ) ;

    // var s=tabla.lista.firstWhere( (o) => o.nombre=="nuevo" , orElse: ()=> EntidadBase() );
    // var r=lista_entidad.firstWhere( (o) => o.nombre=="nnuevo" , orElse: ()=> EntidadBase() );
  }
}
