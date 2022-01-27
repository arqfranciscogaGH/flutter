//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../../../nucleo/ui/comun/Tema.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pagina_preferencias extends StatefulWidget {
  pagina_preferencias({Key key, this.titulo, this.pagina}) : super(key: key);
  String titulo;
  String pagina = 'pagina_preferencias';
  @override
  pagina_preferencias_state createState() => pagina_preferencias_state();
}

class pagina_preferencias_state extends State<pagina_preferencias> {
  //  declaración de variables

  ContextoAplicacion contextoAplicacion;
  IdiomaAplicacion idioma;

  dynamic entidadCaptura;

  // captura
  final formKey = GlobalKey<FormState>();

  //  controladores

  TextEditingController _controllerListaColor = new TextEditingController();

  //  otros

  //  dispose widget
  @override
  void dispose() {
    super.dispose();
  }

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = 'pagina_preferencias';
    // contextoAplicacion=ContextoAplicacion.obtener(widget.contextoAplicacion);
  }

  //
  //   construir  interfaz de usuario
  //

  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    idioma = IdiomaAplicacion.obtener(context, idioma);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(widget.titulo),
        gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Colores.obtenerColor(Configuracion.colorSecundario)
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Accion.regresar(context);
            },
          ),
        ],
      ),

      body: mostrarCaptura(context, formKey, cambiarValor, validar,
          definicionControles, entidadCaptura),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Boton.crearBotonFlotante(
        context,
        ElementoLista(
            icono: "save", accion: guardar, argumento: contextoAplicacion),
      ),
      drawer: Menu.crearListaMenuLateral(
          context, OpcionesMenus.obtenerMenuPrincipal(), "Detalle de persona"),
      //)
    );
  }

  Widget mostrarCaptura(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function cambiarValor,
      Function validar,
      Function metodoDefinicionControles,
      dynamic entidadCaptura) {
    return /* SingleChildScrollView(
              child:  */
        Container(
      padding: EdgeInsets.all(15.0),
      child: Captura.mostrarFormulario(context, formKey, cambiarValor, validar,
          metodoDefinicionControles, entidadCaptura),

      //)
    );
  }

  List<Widget> definicionControles(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function cambiarValor,
      Function validar,
      dynamic entidadCaptura) {
    List<Control> controles = List<Control>();

    List<ElementoLista> _listaColores = List<ElementoLista>();
    _listaColores.add(ElementoLista(valor: "rojo", titulo: "rojo"));
    _listaColores.add(ElementoLista(valor: "azul", titulo: "azul"));
    _listaColores.add(ElementoLista(valor: "azulindigo", titulo: "azulindigo"));
    _listaColores.add(ElementoLista(valor: "verde", titulo: "verde"));
    _listaColores.add(ElementoLista(valor: "verdeclaro", titulo: "verdeclaro"));
    _listaColores.add(ElementoLista(valor: "lima", titulo: "lima"));
    _listaColores.add(ElementoLista(valor: "amarillo", titulo: "amarillo"));
    _listaColores.add(ElementoLista(valor: "naranja", titulo: "naranja"));
    _listaColores.add(ElementoLista(valor: "cafe", titulo: "cafe"));
    _listaColores.add(ElementoLista(valor: "rosa", titulo: "rosa"));
/*           _listaColores.add(ElementoLista(valor:"negro" , titulo:"negro" ));  
          _listaColores.add(ElementoLista(valor:"negroclaro" , titulo:"negroclaro" ));  
          _listaColores.add(ElementoLista(valor:"negrofuerte" , titulo:"negrofuerte" )); */
    _listaColores.add(ElementoLista(valor: "gris", titulo: "gris"));

    Control lisColoresTema = new Control(
      idControl: "lisColoresTema",
    );
    print(Configuracion.tema);
    lisColoresTema = lisColoresTema.asignar(
        idioma, widget.pagina, Configuracion.tema, cambiarValor, validar);
    lisColoresTema.controlEdicion = _controllerListaColor;
    lisColoresTema.lista = _listaColores;
    controles.add(lisColoresTema);

    controles.add(Control().crear(idioma, widget.pagina, "apaBrillo",
        Configuracion.brillo == 1 ? true : false, cambiarValor, validar));

/* 

          eTipoBorde borde=eTipoBorde.Lineal;
          print  (borde.index);
          borde=eTipoBorde.values[borde.index];
          print  (borde.index);          
          print  (borde.toString());    

          dynamic datos= idioma.obtenerPagina('pagina_preferencias');
          print (datos);
          print (datos['apaBrillo']);
          dynamic valorControl= idioma.obtenerElemento('pagina_preferencias','apaBrillo'); 
          print (valorControl['textoAyuda']);
          print(idioma.obtenerElemento ('pagina_preferencias','botGuardar'));
          print(idioma.obtenerElemento ('pagina_preferencias','lista'));
          dynamic x= idioma.obtenerElemento ('pagina_preferencias','martin');
          // x.foreach( (e) => print(e) );
          // Dropdown
       List<Map<String,dynamic>> maps=[];
          Control temp= controles.firstWhere((o) => o.idControl=="lisColoresTema");
          temp.textoEtiqueta="Hola cambio";
          Map<String,dynamic> ele=temp.toMap();
          maps.add(ele);

          print (temp);
          print (ele);
          print (maps);
          dynamic zzz=maps.firstWhere((o) => o["idControl"]=="lisColoresTema");
          print (zzz);

          List<Map<String,dynamic>> jjjj=controles.map((c) => c.toMap()).toList();
 */
/*           Control con = Control( idControl: "prueba");
          List<Map<String,dynamic>>  j=con.toMapList(controles); */

/* 
          print (jjjj);
          ele.forEach((k,v) => print('${k}: ${v}')); 

          print  ( controles.firstWhere((o) => o.idControl=="lisColoresTema").textoEtiqueta);

          print (Configuracion.brillo);
          print (Configuracion.brillo==1?true:false);

    */
    return cargarControlesCaptura(
        context, controles, idioma, widget.pagina, cambiarValor, validar);
    //return crearControlesCaptura(context,controles).toList();
  }

  //
  //   control  de estado y validaciones
  //

  dynamic validar(Control control, dynamic valor) {}
  dynamic cambiarValor(Control control, dynamic valor) {
    setState(() {
      switch (control.idControl) {
        case "lisColoresTema":
          Configuracion.tema = valor;
          print(Configuracion.tema);
          Tema.cambiarColorTema("default", context);

          break;
        case "apaBrillo":
          Configuracion.brillo = valor == true ? 1 : 0;
          Tema.cambiarBrillo(context);
          break;
      }
    });

    return entidadCaptura;
  }

  void guardar(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();

    setState(() {
      Configuracion.guardarBrillo(Configuracion.brillo);
      Configuracion.guardarTema(Configuracion.tema);
    });
    print(Configuracion.tema);

//   lista de variables

    Variables v = Variables();
    Variable entiddad = Variable();
    entiddad.nombre = "rojo";
    entiddad.tipo = "rojo";
    v.agregar(entiddad);

    Variable entiddad2 = Variable();
    entiddad2.tipo = "azul";
    entiddad2.nombre = "azul";
    v.agregar(entiddad2);

    Variable entiddad3 = v.obtener((c) => c.tipo == "azul");
    entiddad3.tipo = "verde";
    v.actualizar((c) => c.tipo == "verde", entiddad3);

    v.eliminar(entiddad);

/*    coversiones

       List<Map<String,dynamic>> jjjj=v.obtenerLista().map((c) => c.toMap()).toList();
       List<Map<String,dynamic>> jjjj= v.lisTotMap();
        print (jjjj);
        print (v.lisTotMap());
        String  st=v.toJson();
        print (st);

     print (v.fromMap(v.lisTotMap(),new Variable()));  
     Control con = Control( idControl: "prueba");
     List<Map<String,dynamic>>  j=con.toMapList(controles);

*/
  }
}
