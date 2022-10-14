//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto 

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';



class pagina_inicio extends StatefulWidget {
  pagina_inicio({
    Key key,
    this.pagina,
    this.titulo,
    this.paginaSiguiente,
    this.paginaAnterior,
  }) : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  static String ruta = "pagina_inicio";
  @override
  _pagina_inicio_state createState() => _pagina_inicio_state();
}

class _pagina_inicio_state extends State<pagina_inicio> {
  //  declaración de variables

  IdiomaAplicacion idioma;

  // captura

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    widget.pagina = pagina_inicio.ruta;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {
    //  contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    idioma = IdiomaAplicacion.obtener(context, idioma);
    widget.titulo = idioma.obtenerElemento(pagina_inicio.ruta, "titulo");
    // if  (Sesion.idUsuario==0)
    // {
    //     Accion.hacer( context, OpcionesMenus.obtener("pagina_acceso"));
    //     return (Scaffold(
    //             appBar: AppBar(
    //               title: Text(widget.titulo),
    //             ),
    //             body:Container(),
    //           )
    //     );
        
  
    // }
    // else
    // {

      return Scaffold(
          appBar: AppBar(
            title: Text(widget.titulo),
            actions: <Widget>[
              // IconButton(
              //   icon: Icon( Icons.arrow_back  ),onPressed: () {
              //           Accion.regresar(context);
              //   },
              // ),
            ],
          ),
          body: PageView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              _paginaInicio(context),
              _paginaPromociones(context)
            ],
          )

          // Column(
          //   mainAxisAlignment:MainAxisAlignment.center,
          //    children: <Widget>[
          //       RaisedButton( child: Text("Subscribir"), onPressed: (){
          //               Accion.hacer(context, ElementoLista(ruta:"Suscripcion_registro"));
          //       }),
          //       Divider(),
          //       RaisedButton( child: Text("Acceder"), onPressed: (){
          //         Navigator.pushReplacementNamed(context, pagina_acceso.routeName);
          //               Accion.hacer(context, ElementoLista(ruta:"pagina_acceso"));
          //       }),
          //       Divider(),

          //  ], )//Column( children :  <Widget> [

          // )
          );
    // }
    

  }

  Widget _paginaInicio(BuildContext context) {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      child: Image(
        image: AssetImage('assets/img/fondo1.jpeg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);
    return SafeArea(
      child: Column(
        children: <Widget>[
          // SizedBox(height: 20.0),
          // Text('  Mi ', style: estiloTexto, textAlign: TextAlign.center),
          // SizedBox(height: 20.0),
          // Text('Directorio', style: estiloTexto, textAlign: TextAlign.center),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }

  Widget _paginaPromociones(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColorLight,
                textColor: Colors.grey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Text('Suscribir', style: TextStyle(fontSize: 20.0)),
                ),
                onPressed: () => Accion.hacer(context,
                    OpcionesMenus.obtener("pagina_Suscripcion_registro")),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColorLight,
                textColor: Colors.grey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Text('Acceder', style: TextStyle(fontSize: 20.0)),
                ),
                onPressed: () => Accion.hacer(
                    context, OpcionesMenus.obtener("pagina_acceso")),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                shape: StadiumBorder(),
                color: Theme.of(context).primaryColorLight,
                textColor: Colors.grey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Text('Iniciar', style: TextStyle(fontSize: 20.0)),
                ),
                onPressed: () {
                  if (Configuracion.cuenta == null ||
                      Configuracion.cuenta == '')
                    Accion.hacer(
                        context, OpcionesMenus.obtener("pagina_acceso"));
                  else
                    Accion.hacer(context,
                        OpcionesMenus.obtener("pagina_menu_principal"));
                },
              ),
            ],
          ),
        ));
  }
}
//
// Termina widget
//
