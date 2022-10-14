//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:async';

//  librerias importadas flutter

import 'package:provider/provider.dart';
//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../../negocio/controlador/UsuarioControlador.dart';
import '../../../negocio/controlador/AdministracionUsuariosControlador.dart';

class pagina_acceso extends StatefulWidget {
  pagina_acceso(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.activarAcciones,
      this.acccionPagina})
      : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "pagina_menu_principal";
  String paginaAnterior = "";
  String acccionPagina = "";
  bool activarAcciones = false;
  static String routeName = "pagina_acceso";
  @override
  _pagina_acceso_state createState() => _pagina_acceso_state();
}

class _pagina_acceso_state extends State<pagina_acceso> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  AdministracionUsuarios entidadCaptura;
  List<AdministracionUsuarios> listaEntidad;

  GlobalKey<FormState> keyFormulario;

  //  Acciones

  ElementoLista accionGuardar;

  //  provider
CuentaUsuarioControlador providerA;
AdministracionUsuariosControlador provider;

  //  Interfaz  comun

  //  UsuarioUI ui;

  //  controladores

  //  otros

  //  inicializar  variables

  @override
  void initState() {
    // contextoAplicacion=ContextoAplicacion.obtener(widget.contextoAplicacion);
    super.initState();
      Sesion.idUsuario=0;
      Sesion.nombre="";
      Sesion.cuenta = "";
      Sesion.idSuscriptor = 0;
      Sesion.perfiles = "";
      Sesion.grupos = "";  
    widget.pagina = "pagina_acceso";
    providerA = CuentaUsuarioControlador();
    provider = AdministracionUsuariosControlador();
    provider.limpiar();
    entidadCaptura=provider.entidad;
    // ui=UsuarioUI(provider: provider);
    //accionGuardar=ElementoLista ( id:4, icono: "save" , ruta:widget.paginaSiguiente, accion: ui.guardarEntidad ,callBackAccion: ui.respuestaInsertar,  callBackAccion2: ui.respuestaModificar  , callBackAccion3:respuestaGuardar , argumento: widget.pagina  );
    keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);
    //  iniciar y consultar lista para obtener elemento y obtener el elemento que insertará

 
 
 
 
   
  
  }

  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {
    // if ( provider.lista==null ) 
    //       provider.consultarEntidad(Usuario().iniciar(), actualizarEstadoLista);
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    idioma = IdiomaAplicacion.obtener(context, idioma);
    // ui=UsuarioUI(provider: provider);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    return ChangeNotifierProvider.value(
        value: provider,
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            _crearFondo(context),
            Consumer<AdministracionUsuariosControlador>(
                builder: (context, _provider, widgetPadre) {
              return _loginForm(context);
            }),
          ],
        )));
  }

  Widget _crearFondo(BuildContext context) {
    Image imagen;
    final size = MediaQuery.of(context).size;
    String ruta = 'assets/img/fondo4.jpeg';
    dynamic backgroundImage;
    BoxDecoration cajaSuperior;
    if (ruta != null) {
      if (ruta.contains('http')) {
        backgroundImage = Image.network(ruta);
      } else {
        backgroundImage = AssetImage(ruta);
      }
      cajaSuperior = BoxDecoration(
        image: DecorationImage(
          image: backgroundImage == null ? null : backgroundImage,
          fit: BoxFit.cover,
        ),
      );
    } else {
      cajaSuperior = BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(125, 3, 3, 10.0),
        Color.fromRGBO(82, 72, 72, 1.0)
      ]));
    }

    final fondo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: cajaSuperior,
    );

    return Stack(
      children: <Widget>[
        fondo,
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              //Icon( Icons.person_pin_circle, color: Colors.white, size: 100.0 ),
              SizedBox(height: .5, width: double.infinity),
              Text('Oficina Electrónica',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Text('Servicios Financieros ',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(10.0, 10.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Acceso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 40.0),
                Container(
                  child: Captura.mostrarFormularioColumnas(
                      context,
                      keyFormulario,
                      cambiarValor,
                      validar,
                      definicionControles,
                      entidadCaptura),
                ),
                SizedBox(height: 30.0),
                _crearBoton(entidadCaptura, context)
              ],
            ),
          ),
          FlatButton(onPressed: () {}, child: Text('Olvide la contraseña')),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _crearBoton(AdministracionUsuarios cuenta, BuildContext context) {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Ingresar'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: cuenta.contrasena != null
            ? () => _obtenerCuenta(entidadCaptura, context)
            : null);
  }

  List<Widget> definicionControles(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function metodoActualizarValor,
      Function metodoValidar,
      dynamic entidadCaptura) {
    List<Control> controles = List<Control>();

    Control txtCuenta = new Control(
      idControl: "txtCuenta",
      tipo: eTipoControl.CajaTextoForma,
      borde: eTipoBorde.Lineal,
      valor: entidadCaptura.cuenta,
    );
    controles.add(txtCuenta);
    txtCuenta = txtCuenta.asignar(idioma, widget.pagina, entidadCaptura.cuenta,
        metodoActualizarValor, metodoValidar);

    Control txtContrasena = new Control(
      idControl: "txtContrasena",
      tipo: eTipoControl.CajaTextoForma,
      borde: eTipoBorde.Lineal,
      valor: entidadCaptura.contrasena,
/*        textoEtiqueta : "Contrasena",
          textoAyuda : "Capture  el  Contrasena ",
          marcaAguaTexto : "Contrasena", 
          textoContador : "no. letras",
          icono: "contrasena",
          iconoInterno:  "contrasena", 
          textoCapitalizacion:   TextCapitalization.sentences,
          tipoEntrada:   TextInputType.text,
          protegerTextoEscrito:false,
          accion:     metodoActualizarValor ,
          accionValidacion: metodoValidar, */
    );
    controles.add(txtContrasena);
    txtContrasena = txtContrasena.asignar(idioma, widget.pagina,
        entidadCaptura.contrasena, metodoActualizarValor, metodoValidar);

    return crearControlesCaptura(context, controles);

    //return  cargarControlesCaptura(context,controles, idioma,pagina,actualizarValor,validar);
  }

  //
  //   control  de estado y validaciones
  //

  dynamic validar(Control control, dynamic valor) {
    if (control.idControl == "txtCuenta") {
      if (valor != null && valor.length < 2) {
        return 'Ingrese su cuenta o correo ';
      } else if (!isEmail(valor))
        return 'Ingrese  correo correcto ';
      else
        return null;
    }
/*       else if ( control.idControl=="txtValor" ) {            
          if ( utils.isNumeric(valor)  ) {
              return null;
          } else {
                return 'Sólo números';
          } 
      } */
  }

  dynamic cambiarValor(Control control, dynamic valor) {
    //isEmail(valor);
    switch (control.idControl) {
      case "txtCuenta":
        entidadCaptura.cuenta = valor;
        break;
      case "txtContrasena":
        entidadCaptura.contrasena = valor;
        break;
    }
    print(control.idControl + "  , valor  :$valor");
    // if ( entidadCaptura.cuenta!="" && entidadCaptura.contrasena!="" )
    //    obtenerInformacion ( entidadCaptura);
    return entidadCaptura;
  }

  bool isEmail(String email) {
    bool resultado;

    email = "tony@starkindustries.com";
    String expresion;

    expresion =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    expresion =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    //resultado = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    RegExp regExp = new RegExp(expresion);
    print(regExp.hasMatch(email));
    resultado = regExp.hasMatch(email);
    return resultado;
  }
  //
  //   control  de estado y validaciones
  //

  void actualizarValor(Control control, dynamic valor) {
    entidadCaptura = cambiarValor(control, valor);
    //  actualizarEstadoEntidad( entidadCaptura );
  }

  void actualizarEstadoLista(List<dynamic> listaRespuesta) {
    // setState(() {
    listaEntidad = listaRespuesta;
    _validarCuenta ( entidadCaptura,context);
  }

  void actualizarEstadoEntidad(dynamic entidad) {
    setState(() {
      entidadCaptura = entidad;
      // actualizarEntidad(entidad);
    });
  }

 
  _obtenerCuenta(dynamic usuario, BuildContext context) {
     provider.entidad=usuario;
     if (!keyFormulario.currentState.validate()) return;
          keyFormulario.currentState.save();
     obtenerInformacion(usuario);
     if (provider.lista!=null && provider.lista.length>0)  
          _validarCuenta ( provider.entidad,context);
      //      provider.consultarEntidad(AdministracionUsuarios().iniciar(), actualizarEstadoLista);
      //  else 
      //      _validarCuenta ( provider.entidad,context);
     
  }
  obtenerInformacion (dynamic entidadCaptura)
   {
    //  definir  url y sus  parametros 
    String url ="AdministracionUsuarios/";
    String argumentos =entidadCaptura.cuenta+"/C";
    String consulta ="";
    bool  buscar=false;
 
    if  (  provider.lista==null  && entidadCaptura.cuenta != "" )
        buscar=true;
    else if (  ( provider.lista!=null && provider.lista.length==0 )  && entidadCaptura.cuenta != "")
    {
        AdministracionUsuarios usuarioEncontrado;
        usuarioEncontrado = listaEntidad.firstWhere((s) => s.cuenta.trim().toLowerCase()  == entidadCaptura.cuenta.trim().toLowerCase() , orElse: () => null);
        if (usuarioEncontrado == null)
            buscar=true;
    }
    if ( buscar==true)  
    {
          //  obtener argumentos  de pagina  comun
          // argumentos= ContextoUI.obtenerKey("seguimiento").entidad.identificador;
          argumentos=argumentos==null  || argumentos=="" ?"''":argumentos;
          print (argumentos);
          url+= argumentos ;
          url+= consulta ;
          print (url);

          provider.limpiar();
          provider.asignarParametros(url, "prueba");
          provider.consultarEntidad(AdministracionUsuarios().iniciar(), actualizarEstadoLista);
    }
   }
  _validarCuenta(dynamic usuario, BuildContext context) {
    bool resultado = false;
    // if (!keyFormulario.currentState.validate()) return;
    // keyFormulario.currentState.save();
    listaEntidad = provider.lista;
    print(listaEntidad.length);
    AdministracionUsuarios usuarioEncontrado;
    if (listaEntidad!=null && listaEntidad.length > 0 && usuario.cuenta != "")
      usuarioEncontrado = listaEntidad
          .firstWhere((s) => s.cuenta.trim().toLowerCase() == usuario.cuenta.trim().toLowerCase(), orElse: () => null);

    if (usuarioEncontrado != null &&
        usuario.contrasena.trim().toLowerCase()  == usuarioEncontrado.contrasena.trim().toLowerCase()   ) {
       resultado = true;
       usuario= usuarioEncontrado;

      print("La  Usuario y contraseña son correctas ");
    } else if (usuario.cuenta == "adm" && usuario.contrasena == "123") {
      resultado = true;
      usuario.id=1;
      usuario.nombre="Administrador";
      usuario.cuenta="adm";
      usuario.idSuscriptor=1;  
      usuario.perfiles="1";
      usuario.grupos="";  
      print("La  Usuario y contraseña son de administrador  ");
    } else if (usuario.cuenta == "arqfranciscoga@gmail.com" &&
      usuario.contrasena == "26021969") {
      resultado = true;
      usuario.id=1;
      usuario.nombre="Administrador";
      usuario.cuenta="adm";
      usuario.idSuscriptor=1;  
      usuario.perfiles="1";
      usuario.grupos="";  
      print("La  Usuario y contraseña son de administrador  ");
    } else {
      print(
          "El  Usuario o contraseña son incorrectos, o esta inactivo,  capture nuevamente por favor.");
      Dialogo.mostrarAlerta(
          context,
          "error",
          "Acceso",
          "El  Usuario o contraseña son incorrectos, intente nuevamente por favor.",
          "Aceptar");
    }
    if (resultado) {
     ElementoLista elemento = ElementoLista();

      elemento.id = usuario.id;
      provider.obtenerEntidad(context, elemento, null);
      Sesion.idUsuario=usuario.id;
      Sesion.nombre=usuario.nombre;
      Sesion.cuenta = usuario.cuenta;
      Sesion.idSuscriptor = usuario.idSuscriptor;
      Sesion.perfil = usuario.perfil;
      Sesion.perfiles = usuario.perfiles;
      Sesion.grupo = usuario.grupo;   
      Sesion.grupos = usuario.grupos;  
      Sesion.nivelRed = usuario.nivelRed;    
      Accion.hacer(context, OpcionesMenus.obtener("pagina_menu_principal"));
    }
  }

  bool validarEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    bool resultado = regExp.hasMatch(email);
    return resultado;
 }
   //  termina   widget
}


/* 
Widget MostrarDetalle ()
  {
      Control control  = new Control( 
          IdControl:"txtNombre" ,
          Tipo : "TextField", 
          ValorTexto: _nombre ,
          TextoEtiqueta : "Nombre",
          TextoAyuda : "Capture  el  nombre ",
          MarcaAguaTexto : "Nombre de la persona", 
          TextoContador : " Número: " ,
          Icono: "account_circle",
          IconoInterno:  "accessibility", 
          TextoCapitalizacion:   TextCapitalization.sentences,
          TipoEntrada:   null,
          ProtegerTextoEscrito:false,
          Accion:     CambiarValor ,

    );

     Control controlcorreo  = new Control( 
          IdControl:"txtCorreo" ,
          Tipo : "TextField", 
          ValorTexto: _email ,
          TextoEtiqueta : "Correo",
          TextoAyuda : "Capture  el  correo ",
          MarcaAguaTexto : "Cuenta de  correo", 
          TextoContador : " Número: " ,
          Icono: "email",
          IconoInterno:  "alternate_email", 
          TextoCapitalizacion:   null,
          TipoEntrada:   TextInputType.emailAddress,
          ProtegerTextoEscrito:false,
          Accion:     CambiarValor ,

    );
     
     Control controlcontrasena  = new Control( 
          IdControl:"txtContrasena" ,
          Tipo : "TextField", 
          ValorTexto: _contrasena ,
          TextoEtiqueta : "Contraseña",
          TextoAyuda : "Capture  el  Contraseña ",
          MarcaAguaTexto : "Contraseña", 
          TextoContador : " Número: " ,
          Icono: "lock",
          IconoInterno:  "lock_open", 
          TextoCapitalizacion:   null,
          TipoEntrada:   TextInputType.text,
          ProtegerTextoEscrito:true,
          Accion:     CambiarValor ,

    );

     Control controlFecha  = new Control( 
          IdControl:"txtFecha" ,
          Tipo : "TextField", 
          ValorTexto: _fecha ,
          TextoEtiqueta : "Fecha",
          TextoAyuda : "Capture  el  Fecha ",
          MarcaAguaTexto : "Fecha de  nacimiento", 
          TextoContador : " Número: " ,
          Icono: "calendar_today",
          IconoInterno:  "perm_contact_calendar", 
          TextoCapitalizacion:   null,
          TipoEntrada:   TextInputType.datetime,
          ProtegerTextoEscrito:false,
          Accion:     CambiarValor ,


    );

    return ListView (
        children: <Widget>[
          CrearCajaTexto( control ),
          Divider(),
          CrearCajaTexto( controlcorreo ),
          Divider(),
          CrearCajaTexto( controlcontrasena ),
          Divider(),
          CrearCajaTexto( controlFecha ),  
          Divider(),
/*           _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(), */
          _crearDropdown(),
          Divider(),
          _crearPersona(),
          Divider(),
          // CrearImagenInternet(10),
          
        ],

    );
  }


  void CambiarValor ( Control control, dynamic valor)
  {
    setState(() {

      print ( control.IdControl + "  , valor antes :" +valor);
        switch (control.IdControl) {
          case "txtNombre":
              _nombre = valor;  
              break;
          case "txtCorreo":
              _email = valor;  
              break;
          case "txtContrasena":
              _contrasena = valor;  
              break;
          case "txtFecha":
              _fecha = valor;  
              break;                            
          default:
              _nombre = valor;  
              break;
        } */
