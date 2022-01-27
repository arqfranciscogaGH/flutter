//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

//  librerias importadas flutter

import 'package:pie_chart/pie_chart.dart';

import 'package:fl_animated_linechart/chart/area_line_chart.dart';
import 'package:fl_animated_linechart/common/pair.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';

//  librerias  proyecto
import '../../configuracion/configuracionAplicacion.dart';
import '../../../nucleo/ui/ui.dart';
import '../../contexto/contexto.dart';

import '../paginas/FlujoTrabajo/EstadisticasFlujoUI.dart';


class pagina_grafica extends StatefulWidget {
  pagina_grafica({Key key, this.titulo, this.contextoAplicacion})
      : super(key: key);
  final String titulo;
  ContextoAplicacion contextoAplicacion;

  @override
  pagina_grafica_state createState() => pagina_grafica_state();
}

class pagina_grafica_state extends State<pagina_grafica>
    with SingleTickerProviderStateMixin {
  IdiomaAplicacion idioma;
  String pagina = "pagina_detalle_Persona";
  String paginaSiguiente = "pagina_detalle_Persona";
  String paginaAnterior = "pagina_lista_Persona";
  String _tipoGrafica = "dona";

  double valor = 0;
  double restante = 0;
  List<ElementoSerie> datos;
  List<ElementoSerie> datosIndividual;
  List<ElementoSerie> listaCronogramaV;
  List<ElementoSerie> listaCronogramaH;
  List<ElementoSerie> datosGrupo;

  EstadisticasFlujoControlador provider;
  EstadisticasFlujoUI ui;

  @override
  void initState() {
    super.initState();
  
    provider = EstadisticasFlujoControlador();
    ui = EstadisticasFlujoUI(provider: provider);
    provider.limpiar();
    provider.asignarParametros("FTConsulta/LINEAIV/''/1/VerEstadisticasFlujoTrabajoPorTarea/", "prueba");
    provider.consultarEntidad(EstadisticasFlujo().iniciar(), actualizarEstadoLista);

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    idioma = IdiomaAplicacion.obtener(context, idioma);
    Color selection = Colors.yellow[400];
    listaCronogramaV = [
      ElementoSerie(
        titulo: "A",
        x: 10,
        y: 90,
        color: Colors.green,
      ),
      ElementoSerie(
        titulo: "B",
        x: 10,
        y: 200,
        color: Colors.blue,
      ),
      ElementoSerie(
        titulo: "C",
        x: 20,
        y: 300,
        color: Colors.pink,
      ),
    ];
    listaCronogramaH = [
      ElementoSerie(
        titulo: "A",
        x: 10,
        y: 10,
        color: Colors.amber,
      ),
      ElementoSerie(
        titulo: "b",
        x: 20,
        y: 10,
        color: Colors.teal,
      ),
      ElementoSerie(
        titulo: "c",
        x: 50,
        y: 10,
        color: Colors.grey,
      ),
    ];

    datosIndividual = [
      ElementoSerie(
        serie: "ninguno",
        titulo: "Maria",
        valor: 1,
        metrica: 50,
        colorG:  charts.ColorUtil.fromDartColor(Colores.obtenerColor("amarillo")),

      ),
      ElementoSerie(
        serie: "ninguno",
        titulo: "Juan",
        valor: 2,
        metrica: 15,
        colorG: charts.ColorUtil.fromDartColor(Colores.obtenerColorIndex(2)),
      ),
      ElementoSerie(
        serie: "ninguno",
        titulo: "Mitzi",
        valor: 3,
        metrica: 100,
        colorG:charts.ColorUtil.fromDartColor( Colores.obtenerColorIndex(3)),
      ),
      ElementoSerie(
        serie: "ninguno",
        titulo: "Sergio",
        valor: 4,
        metrica: 40,
        colorG: charts.ColorUtil.fromDartColor(Colores.obtenerColorIndex(4)),
      )
    ];
    datosGrupo = [
      ElementoSerie(
        serie: "2019",
        titulo: "Ara",
        valor: 4,
        metrica: 100,
        colorG: charts.ColorUtil.fromDartColor(Colores.obtenerColorIndex(5)),
      ),
      ElementoSerie(
        serie: "2020",
        titulo: "Ara",
        valor: 50,
        metrica: 50,
        colorG:charts.ColorUtil.fromDartColor( Colores.obtenerColorIndex(6)),
      ),
      ElementoSerie(
        serie: "2019",
        titulo: "Vanessa",
        valor: 25,
        metrica: 25,
        colorG:charts.ColorUtil.fromDartColor(  Colores.obtenerColorIndex(7)),
      ),
      ElementoSerie(
        serie: "2020",
        titulo: "Vanessa",
        valor: 15,
        metrica: 15,
        colorG:charts.ColorUtil.fromDartColor(  Colores.obtenerColorIndex(8)),
       // color: charts.ColorUtil.fromDartColor(Colors.purple),
      ),
    ];
    actualizarGrafica(_tipoGrafica == null ? "barra" : _tipoGrafica);
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.titulo),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              actualizarGrafica("barra");
            },
          ),
          IconButton(
            icon: Icon(Icons.insert_chart_outlined_rounded),
            onPressed: () {
              actualizarGrafica("barraGrupo");
            },
          ),
          IconButton(
            icon: Icon(Icons.stacked_bar_chart),
            onPressed: () {
              actualizarGrafica("barraPila");
            },
          ),
          IconButton(
            icon: Icon(Icons.donut_large),
            onPressed: () {
              actualizarGrafica("dona");
            },
          ),
          IconButton(
            icon: Icon(Icons.pie_chart),
            onPressed: () {
              actualizarGrafica("pieNormal");
            }, //pieNormal
          ),
          IconButton(
            icon: Icon(Icons.multiline_chart),
            onPressed: () {
              actualizarGrafica("linea");
            }, //lineaArea
          ),
          IconButton(
            icon: Icon(Icons.stacked_line_chart),
            onPressed: () {
              actualizarGrafica("lineaArea");
            },
          ),
          IconButton(
            icon: Icon(Icons.bubble_chart),
            onPressed: () {
              actualizarGrafica("burbuja");
            },
          ),
          IconButton(
            icon: Icon(Icons.table_chart),
            onPressed: () {
              actualizarGrafica("cronogramaHorizontal"); // "cronogramaVertical"
            },
          ),
        ],
      ),

      body: SafeArea(
          child: vista_Grafica(
              datos: datos,
              titulo: "Grafica  Prueba",
              tipoGrafica: _tipoGrafica,
              context: context)),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: Menu.crearBotonFlotable("btnGuardar",idioma.obtenerElemento ('pagina_preferencias','botGuardar'), " Guardar información ",Icons.add_to_queue, controlar),
      drawer: Menu.crearListaMenuLateral(
          context, OpcionesMenus.obtenerMenuPrincipal(), "Grafica"),
    );
  }
void actualizarEstadoLista(List<dynamic> listaRespuesta) {
    // listaEntidad=listaRespuesta;
    for (EstadisticasFlujo ele in listaRespuesta) { 
      print (ele.actividad);
    }
    // setState(() {

    // });
   }
  void actualizarGrafica(String tipoGrafica) {
    setState(() {
      _tipoGrafica = tipoGrafica;
      if (tipoGrafica == "cronogramaHorizontal") {
        datos = listaCronogramaH;
      } else if (tipoGrafica == "cronogramaVertical") {
        datos = listaCronogramaV;
      } else if (tipoGrafica == "dona") {
        datos = datosIndividual;
      } else if (tipoGrafica == "pieNormal") {
        datos = datosIndividual;
      } else if (tipoGrafica == "burbuja") {
        datos = datosIndividual;
      } else if (tipoGrafica == "barra") {
        datos = datosIndividual;
      } else if (tipoGrafica == "barraGrupo") {
        datos = datosGrupo;
      } else if (tipoGrafica == "barraPila") {
        datos = datosGrupo;
      } else if (tipoGrafica == "linea") {
        datos = datosIndividual;
      } else if (tipoGrafica == "lineaArea") {
        datos = datosIndividual;
      }
    });
  }
  
}

class vista_Grafica extends StatelessWidget {
  final List<ElementoSerie> datos;
  final String titulo;
  String tipoGrafica = "barra"; //{  barra , pie ,  dona, linea};
  BuildContext context;
  vista_Grafica({
    this.titulo,
    this.tipoGrafica,
    this.context,
    @required this.datos,
  });

  @override
  Widget build(BuildContext context) {
    print(tipoGrafica);

    double resultado = 0;
    datos.forEach((ElementoSerie item) => resultado += item.metrica);
    print(" la  suma es : $resultado");

    return Container(
      child: generaGrafica(context,"widget.titulo",
          tipoGrafica == null ? "barra" : tipoGrafica, datos),
    );
  }
}

Map<DateTime, double> createLine2() {
  Map<DateTime, double> data = {};
  data[DateTime.now().subtract(Duration(minutes: 40))] = 10.0;
  data[DateTime.now().subtract(Duration(minutes: 30))] = 14.0;
  data[DateTime.now().subtract(Duration(minutes: 25))] = 19.0;
  data[DateTime.now().subtract(Duration(minutes: 20))] = 21.0;
  data[DateTime.now().subtract(Duration(minutes: 15))] = 27.0;
  data[DateTime.now().subtract(Duration(minutes: 10))] = 29.0;
  data[DateTime.now().subtract(Duration(minutes: 5))] = 190.0;
  return data;
}

Map<DateTime, double> createLine2_2() {
  Map<DateTime, double> data = {};
  data[DateTime.now().subtract(Duration(minutes: 40))] = 17.0;
  data[DateTime.now().subtract(Duration(minutes: 30))] = 30.0;
  data[DateTime.now().subtract(Duration(minutes: 25))] = 47.0;
  data[DateTime.now().subtract(Duration(minutes: 20))] = 29.0;
  data[DateTime.now().subtract(Duration(minutes: 15))] = 23.0;
  data[DateTime.now().subtract(Duration(minutes: 10))] = 47.0;
  data[DateTime.now().subtract(Duration(minutes: 5))] = 96.0;
  return data;
}

Widget generaGrafica(BuildContext context,String id, String tipoGrafica, List<ElementoSerie> datos  ) {
  if (tipoGrafica == "cronogramaVertical")
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: Grafica.crearCronograma(context,"v", datos),
      ),
    );
  if (tipoGrafica == "cronogramaHorizontal")
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Grafica.crearCronograma(context,"h", datos),
      ),
    );
  else if (tipoGrafica == "pieNormal") {
    return Grafica.CrearPie(context,"id", datos,null);
  } else if (tipoGrafica == "dona") {
    return Grafica.CrearDona(context,"id", datos,null);
  } else if (tipoGrafica == "burbuja") {
    return Grafica.CrearBurbujas(context,datos,null);
  } else if (tipoGrafica == "barra") {
    return Grafica.CrearBarras(context,"id", datos,null);
  } else if (tipoGrafica == "barraGrupo") {
    return Grafica.CrearBarrasGrupo(context,"id", datos,null);
  } else if (tipoGrafica == "barraPila") {
    return Grafica.CrearBarrasPila(context,"id", datos,null);
  } else if (tipoGrafica == "lineaArea") {
    return Grafica.CrearArea(context,"id", datos,null);
  } else if (tipoGrafica == "linea") {
    return Grafica.CrearLineas(context,"id", datos,null);
  } else if (tipoGrafica == "area") {
    Map<DateTime, double> line1 = createLine2();
    Map<DateTime, double> line2 = createLine2_2();

    LineChart chart;

    chart = AreaLineChart.fromDateTimeMaps(
        [line1], [Colors.red.shade900], ['C'],
        gradients: [Pair(Colors.yellow.shade400, Colors.red.shade700)]);
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedLineChart(
        chart,
        key: UniqueKey(),
      ),
    ));
  } else if (tipoGrafica == "pie") {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);

    List<Color> colorList = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
    ];

    return Container(
        //child: charts.BarChart(series, animate: true),
        child: PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32.0,
      chartRadius: MediaQuery.of(context).size.width / 2.7,
      // showChartValuesInPercentage: true,
      // showChartValues: true,
      // showChartValuesOutside: false,
      // chartValueBackgroundColor: Colors.grey[200],
      // colorList: colorList,
      // showLegends: true,
      // legendPosition: LegendPosition.right,
      // decimalPlaces: 1,
      // showChartValueLabel: true,
      // initialAngle: 0,
      // chartValueStyle: defaultChartValueStyle.copyWith(
      //   color: Colors.blueGrey[900].withOpacity(0.9),
      // ),
      chartType: ChartType.disc,
      // chartType: ChartType.ring,
      //showChartValuesOutside: true,
    ));
  }
}
