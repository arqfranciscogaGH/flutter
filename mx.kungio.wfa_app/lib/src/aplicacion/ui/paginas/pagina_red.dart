

//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'package:graphview/GraphView.dart';


//  librerias  proyecto

import '../../configuracion/configuracionAplicacion.dart';
import '../../../nucleo/ui/ui.dart';
import '../../contexto/contexto.dart';

import '../../negocio/controlador/SuscripcionControlador.dart';

import '../../negocio/controlador/ConsultarSociosControlador.dart';


class pagina_red extends StatefulWidget {
  pagina_red(
  { Key key,
    this.pagina,
    this.titulo,
    this.paginaSiguiente,
    this.paginaAnterior,
  }) : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  static String ruta = "pagina_red";
  @override
  _pagina_red_State createState() => _pagina_red_State();
}

class _pagina_red_State extends State<pagina_red> {
  //  variables
    IdiomaAplicacion idioma;

  // KEYS

  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
  Random r = Random();
  List<Map<String, dynamic>> socios = List<Map<String, dynamic>>();
  List<ConsultarSocios> _listaSocios = List<ConsultarSocios>();
  ConsultarSociosControlador provider;

  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_red.ruta;

    provider = ConsultarSociosControlador();
    provider.limpiar();
  
    provider.asignarParametrosFiltro("ConsultarSocios","0/''", "prueba");
    provider.consultarEntidad(ConsultarSocios().iniciar(), actualizarEstadoListaU);



    builder
      ..siblingSeparation = (50)
      ..levelSeparation = (50)
      ..subtreeSeparation = (50)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
  }
  @override
  Widget build(BuildContext context) {
    // idioma = IdiomaAplicacion.obtener(context, idioma);
    // widget.titulo = idioma.obtenerElemento( pagina_red.ruta, "titulo");  
    widget.titulo="Red de socios";  
    if (provider.lista!=null)
    {
        _listaSocios=provider.lista;
        cargaElementos();
    }

    return Scaffold(
           appBar: GradientAppBar(
            title: Text(widget.titulo),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colores.obtenerColor(Configuracion.colorSecundario)
            ]),
            actions: <Widget>[
                IconButton(
                      icon: Icon( Icons.arrow_back  ),  onPressed: ()
                      {
                              Accion.regresar(context);
                      },
                ),
             ],
        ),

        drawer: Menu.crearListaMenuLateral(
              context, OpcionesMenus.obtenerMenuPrincipal(), ""),
        body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
                Wrap(
                  children: [
                    // Container(
                    //   width: 100,
                    //   child: TextFormField(
                    //     initialValue: builder.siblingSeparation.toString(),
                    //     decoration: InputDecoration(labelText: "Sibling Separation"),
                    //     onChanged: (text) {
                    //       builder.siblingSeparation = int.tryParse(text) ?? 50;
                    //       this.setState(() {});
                    //     },
                    //   ),
                    // ),
                    // Container(
                    //   width: 100,
                    //   child: TextFormField(
                    //     initialValue: builder.levelSeparation.toString(),
                    //     decoration: InputDecoration(labelText: "Level Separation"),
                    //     onChanged: (text) {
                    //       builder.levelSeparation = int.tryParse(text) ?? 50;
                    //       this.setState(() {});
                    //     },
                    //   ),
                    // ),
                    // Container(
                    //   width: 100,
                    //   child: TextFormField(
                    //     initialValue: builder.subtreeSeparation.toString(),
                    //     decoration: InputDecoration(labelText: "Subtree separation"),
                    //     onChanged: (text) {
                    //       builder.subtreeSeparation = int.tryParse(text) ?? 50;
                    //       this.setState(() {});
                    //     },
                    //   ),
                    // ),
                    // Container(
                    //   width: 100,
                    //   child: TextFormField(
                    //     initialValue: builder.orientation.toString(),
                    //     decoration: InputDecoration(labelText: "Orientation"),
                    //     onChanged: (text) {
                    //       builder.orientation = int.tryParse(text) ?? 100;
                    //       this.setState(() {});
                    //     },
                    //   ),
                    // ),
                    // RaisedButton(
                    //   onPressed: () {
                    //     final node12 = Node(rectangleWidget(r.nextInt(100)));
                    //     var edge =
                    //         graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                    //     print(node12);
                    //     print(edge);
                    //     graph.addEdge(edge, node12);
                    //     setState(() {});
                    //   },
                    //   child: Text("Add"),
                    // )
                  ],
        ),
        Expanded(
          child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(100),
              minScale: 0.01,
              maxScale: 5.6,
              child: GraphView(
                graph: graph,
                algorithm:
                    BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = Colors.black
                  ..strokeWidth = 1
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var id = node.key.value as int;
                  print(' pintando nodo  ${id}');
                  return rectangleWidget(id);
                },
              )),
        ),
      ],
    ));
  }


  
     void actualizarEstadoListaU(List<dynamic> listaRespuesta) {
      _listaSocios=listaRespuesta;
      setState(() {});
      // cargaElementos();
    }

    List<dynamic>  obtenerRedSocios() {
      int idSocio=Sesion.idUsuario;
      ConsultarSocios socio;
      List<dynamic> lista_red= List<dynamic> ();
      if ( _listaSocios.length>0)
      {
          if ( idSocio==null || idSocio==0 )
            socio=_listaSocios.first;
          else
            socio=_listaSocios.where((s) => s.idUsuario == idSocio).first;
          idSocio=socio.idUsuario;   

          lista_red.add(_listaSocios.where((s) => s.idUsuario == idSocio).first ) ;
          List<dynamic> lista_hijos = obtenerSociosRedPorSocio( idSocio, _listaSocios, lista_red);
      }
      return  lista_red;
    }
    List<dynamic>  obtenerSociosRedPorSocio( int idSocio,  List<dynamic> listaSocios,  List<dynamic> lista_red) {

        List<dynamic> listaHijos = listaSocios
          .where((s) => s.idUsuarioSuperior == idSocio && s.activo==1)
          .toList();
        for (ConsultarSocios socio in listaHijos) {
          print(socio.idUsuario);
          print(socio.idUsuarioSuperior);
          print(socio.cuenta);
          print(socio.nombre);
          print(socio.idNivelRed);
          print(socio.claveNivelRed);
          print(socio.nivelRed);
          if (socio.activo==1)
          {
             lista_red.add(socio);
             obtenerSociosRedPorSocio(socio.id, listaSocios ,lista_red );
          }

        }
       return listaHijos;
   }
  List<dynamic> obtenerSociosNivelInferior( List<dynamic> listaEntrada, int idUsuarioSuperior) {

    List<dynamic> listaRespuesta = listaEntrada
        .where((s) => s.idUsuarioSuperior == idUsuarioSuperior && s.activo==1)
        .toList();
    // for (ConsultarSocios entidad in listaRespuesta) {
    //   print("id:${entidad.id}");
    //   print("idSuscriptor:${entidad.idUsuarioSuperior}");
    //   print("tipo:${entidad.cuenta}");
    //   print("nombre:${entidad.nombre}");
    // }
    return listaRespuesta;
  }
 
  cargaElementos() {
     creaDiagramaSocios( obtenerRedSocios()  );
   }
  cargaElementosPrueba() {

    // if ( _listaSocios!=null && _listaSocios.length==0 )  
    // {
    //     Suscripcion s1 = Suscripcion(
    //         nombre: "Kungio",
    //         tipo: "Kungio",
    //         id: 1,
    //         idSuscriptor: 0);
    //     _listaSocios.add(s1);
    // }

    // Suscripcion s2 = Suscripcion(
    //     nombre: "Pedro",
    //     tipo: "Gold",
    //     id: 2,
    //     idSuscriptor: 1);
    // _listaSocios.add(s2);
    // Suscripcion s3 = Suscripcion(
    //     nombre: "Vane",
    //     tipo: "Platino",
    //     id: 3,
    //     idSuscriptor: 1);
    // _listaSocios.add(s3);
    // Suscripcion s4 = Suscripcion(
    //     nombre: "Maria",
    //     tipo: "Platino",
    //     id: 4,
    //     idSuscriptor: 1);
    // _listaSocios.add(s4);

    // Suscripcion s5 = Suscripcion(
    //     nombre: "Tere",
    //     tipo: "Platino",
    //     id: 5,
    //     idSuscriptor: 2);
    // _listaSocios.add(s5);

    // Suscripcion s6 = Suscripcion(
    //     nombre: "carlos",
    //     tipo: "Bronze",
    //     id: 6,
    //     idSuscriptor: 3);
    // _listaSocios.add(s6);

    // Suscripcion s7 = Suscripcion(
    //     nombre: "Tere",
    //     tipo: "Bronze",
    //     id: 7,
    //     idSuscriptor: 5);
    // _listaSocios.add(s7);

    // Suscripcion s8 = Suscripcion(
    //     nombre: "Irma",
    //     tipo: "Bronze",
    //     id: 8,
    //     idSuscriptor: 3);
    // _listaSocios.add(s8);

    // Suscripcion s9 = Suscripcion(
    //     nombre: "Mit",
    //     tipo: "Bronze",
    //     id: 9,
    //     idSuscriptor: 5);
    // _listaSocios.add(s9);

    // Suscripcion s10 = Suscripcion(
    //     nombre: "Fran",
    //     tipo: "Bronze",
    //     id: 10,
    //     idSuscriptor: 4);
    // _listaSocios.add(s10);

    // Map<String, dynamic> socio1 = {
    //   "nombre": "Juan",
    //   "tipo": "Gold",
    //   "idSuscriptor": "1",
    //   "idSuscriptorAscendente": "0"
    // };
    // Map<String, dynamic> socio2 = {
    //   "nombre": "Pedro",
    //   "tipo": "Platino",
    //   "idSuscriptor": "2",
    //   "idSuscriptorAscendente": "1"
    // };
    // Map<String, dynamic> socio3 = {
    //   "nombre": "Jon",
    //   "tipo": "Bronze",
    //   "idSuscriptor": "3",
    //   "idSuscriptorAscendente": "1"
    // };
    // Map<String, dynamic> socio4 = {
    //   "nombre": "Maria",
    //   "tipo": "Bronze",
    //   "idSuscriptor": "4",
    //   "idSuscriptorAscendente": "2"
    // };
    // socios.add(socio1);
    // socios.add(socio2);
    // socios.add(socio3);
    // socios.add(socio4);
    // for (var i = 0; i < socios.length; i++) {
    //   print(socios[i]['nombre']);
    //   print(socios[i]['tipo']);
    //   print(socios[i]['idSuscriptor']);
    //   print(socios[i]['idSuscriptorAscendente']);
    // }
    // for (Suscripcion socio in _listaSocios) {
    //   if  (socio.id!=1)
    //   {
    //       print(socio.clave);
    //       print(socio.nombre);
    //       print(socio.tipo);
    //       print(socio.id);
    //       print(socio.idSuscriptor);
    //       Node nodePadre = Node.Id(socio.id);
    //       List<dynamic> lista_hijos =
    //           obtenerRedPorSuscripcion(_listaSocios, socio.id);
    //       for (Suscripcion hijo in lista_hijos) {
    //         print(hijo.id);
    //         Node nodeHijo = Node.Id(hijo.id);
    //         graph.addEdge(nodePadre, nodeHijo,
    //             paint: Paint()..color = Colors.black);
    //       }
    //   }
    // }

  }

 
  creaDiagramaSocios( List<dynamic> lista_Socios)
  {
    List<dynamic> listaLideresSocios = lista_Socios.where((s) => s.idNivelRed != 1).toList();
    for (ConsultarSocios socio in listaLideresSocios) {
          print(socio.id);
          print(socio.idUsuario);
          print(socio.clave);
          print(socio.nombre);
          print(socio.idUsuarioSuperior);
          print(socio.idNivelRed);
          print(socio.claveNivelRed);
          print(socio.nivelRed);
          Node nodePadre = Node.Id(socio.id);
          List<dynamic> lista_hijos =
              obtenerSociosNivelInferior(lista_Socios, socio.id);
          for (ConsultarSocios hijo in lista_hijos) {
            print(hijo.id);
            Node nodeHijo = Node.Id(hijo.id);
            graph.addEdge(nodePadre, nodeHijo,
                paint: Paint()..color = Colors.black);
          }
      // }
    }
  }


  Widget rectangleWidget(int id) {
   ConsultarSocios s =ConsultarSocios();
    if ( _listaSocios!=null && _listaSocios.length>0 )  
    {
        print(' buscar : ${id}');
        // s= _listaSocios.where((s) => s.id == id).first;
        s = _listaSocios.firstWhere((s) => s.id == id, orElse: () => null);
        print(' encontro widget : ${s.id}');
        print(' encontro widget : ${s.cuenta}');
        print(' encontro widget : ${s.claveNivelRed}');
           if (s==null)
        s =ConsultarSocios();
        if (s.claveNivelRed==null  || s.claveNivelRed==''  )
            s.claveNivelRed="B";
        if (s.cuenta==null  || s.cuenta==''  )
            s.cuenta="sin Nombre";
        
        // print(' widget : ${s.tipo}');
        return InkWell(
          onTap: () {
            print('clicked ${id}');
          },
          child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(color: Colores.obtenerColor(s.claveNivelRed), spreadRadius: 1),
                ],
              ),
              child: Text('${s.cuenta}')),
        );
    }
    else
    return Container();
 
  }
  
  // iniciarNodos() {
  //   final node1 = Node.Id(1);
  //   final node2 = Node.Id(2);
  //   final node3 = Node.Id(3);
  //   final node4 = Node.Id(4);
  //   final node5 = Node.Id(5);
  //   final node6 = Node.Id(6);
  //   final node8 = Node.Id(7);
  //   final node7 = Node.Id(8);
  //   final node9 = Node.Id(9);
  //   final node10 = Node(rectangleWidget(
  //       10)); //using deprecated mechanism of directly placing the widget here
  //   final node11 = Node(rectangleWidget(11));
  //   final node12 = Node(rectangleWidget(12));

  //   graph.addEdge(node1, node2);
  //   graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
  //   graph.addEdge(node1, node4, paint: Paint()..color = Colors.pink);
  //   graph.addEdge(node2, node5);
  //   graph.addEdge(node2, node6);
  //   graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
  //   graph.addEdge(node6, node8, paint: Paint()..color = Colors.green);
  //   graph.addEdge(node4, node9);
  //   graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
  //   graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
  //   graph.addEdge(node11, node12);
  // }

}
