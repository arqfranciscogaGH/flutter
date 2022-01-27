//  librerias internas de flutter
import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:intl/intl.dart';
//  librerias importadas flutter

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bubble_chart/bubble_chart.dart';

//  librerias  proyecto

import '../../../../nucleo/negocio/endidad/ElementoSerie.dart';
export '../../../../nucleo/negocio/endidad/ElementoSerie.dart';
import '../../comun/colores.dart';
import '../../comun/Responsivo.dart';


  //  WIDGET vista vista_GraficaDinamica




class vista_GraficaDinamica extends StatefulWidget {
    vista_GraficaDinamica({Key key, 
    this.titulo,
    
    this.tipoGrafica,
    this.datos,
    this.metodoSeleccion,
    this.context,
    })
      : super(key: key);

    String titulo;
    String tipoGrafica = "dona";
    List<ElementoSerie> datos;
    Function metodoSeleccion;
    BuildContext context;

  @override
  _vista_GraficaDinamica_state createState() => _vista_GraficaDinamica_state();  
}
class _vista_GraficaDinamica_state extends State<vista_GraficaDinamica>
  {  

  List<ElementoSerie> datos;
  String tipoGrafica = "dona";
  Function  seleccion;
  @override
  Widget build(BuildContext context) {
    datos=widget.datos;
    tipoGrafica=widget.tipoGrafica;
    seleccion=widget.metodoSeleccion;
    // tipoGrafica=widget.tipoGrafica;
    print(widget.tipoGrafica);
 
    //     return Center(child: CircularProgressIndicator());

 
  int importeC = 0;
  int importe = 0;
  int cuenta = 0;
  if  (datos!=null)
  {
      datos.forEach((ElementoSerie item) {
         print(" el elemento : "+item.titulo);
         importeC= item.metrica==null? 0:item.metrica;
         if (item.metrica!=null)
         {
           
         }
         else
         {

         }
         print(" el importe C es : "+importeC.toString() );

        //print(" el importe  es : "+item.metrica==null? "":item.metrica.toString() );
         importe += importeC;
         print(" el total  importe   es : $importe");
      });
      // datos.forEach((ElementoSerie item) => importe += item.metrica);
      // print(" el importe  es : $importe");
    
      datos.forEach((ElementoSerie item) => cuenta += item.valor);
      print(" la  cuenta es : $cuenta");

  }
  double height =100;

  if  (MediaQuery.of(context).orientation.toString() =='Orientation.portrait' ) 
  {
      if (Responsivo.identifciarDispositivo(context)=="tablet" )
      {
        height=75;
      }
      if (Responsivo.identifciarDispositivo(context)=="tel" )
      {
        height=75;

      }
  }   
  else
  {
      if (Responsivo.identifciarDispositivo(context)=="tablet" )
      {
        height=70;

      }
      if (Responsivo.identifciarDispositivo(context)=="tel" )
      {
        height=65;
      }
  }     
  if  (datos==null  || datos.length ==0)
        return Center(child: CircularProgressIndicator());
    else
      return Stack(
        children: [ 
          tipoGrafica == "dona"?Positioned.fill(
                child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          SizedBox(height: height),
                          cuenta>=0?generaResumen(context ,cuenta,importe): SizedBox.shrink(),
                  
                ]),
          ): SizedBox(height: 0),
          definirGraficaDinamicamente(context,widget.titulo, tipoGrafica == null ? "barra" : tipoGrafica,datos, seleccion),
        ]
      );
  }
Widget generaResumen(BuildContext context,int cuenta,int  importe)
{
    print  (' MediaQuery') ;
    print  ( MediaQuery.of(context).size.height ) ;
    print  ( MediaQuery.of(context).size.width ) ;        
    print  ( MediaQuery.of(context).orientation ) ;

    double minRadius =100;
    double maxRadius =100;

    if  (MediaQuery.of(context).orientation.toString() =='Orientation.portrait' ) 
    {
       if (Responsivo.identifciarDispositivo(context)=="tablet" )
       {
          minRadius=25;
          maxRadius=95;
       }
       if (Responsivo.identifciarDispositivo(context)=="tel" )
       {
          minRadius=25;
          maxRadius=80;
       }
    }   
    else
    {
       if (Responsivo.identifciarDispositivo(context)=="tablet" )
       {
          minRadius=25;
          maxRadius=95;
       }
       if (Responsivo.identifciarDispositivo(context)=="tel" )
       {
          minRadius=0;
          maxRadius=0;
       }
    }     
    var f = NumberFormat('###,###,##0', 'en_US');
      return   CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.8),
              minRadius:  minRadius,
              maxRadius:  maxRadius,

              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      Text(
                                      importe ==0? "":String.fromCharCode(36)+f.format(importe),
                                      style: Theme.of(context).textTheme.headline5.copyWith(
                                            color: Theme.of(context).backgroundColor,
                                            //fontWeight: FontWeight.w600,
                                            height: 0.5,
                                          ),
                        
                        ),
                        Text(  cuenta ==0? "": " # $cuenta")
              ])
       );
 } 
}

class Grafica {
  static List<dynamic> crearSeriesNumerica(
      String id, List<ElementoSerie> datos) {
    List<charts.Series<ElementoSerie, int>> series = [
      charts.Series(
          id: id,
          labelAccessorFn: (ElementoSerie elemento, _) => '${elemento.metrica}',
          data: datos,
          domainFn: (ElementoSerie series, _) => series.valor,
          measureFn: (ElementoSerie series, _) => series.metrica,
          //colorFn: (ElementoSerie series, _) => series.color
          colorFn: (ElementoSerie series, _) => charts.MaterialPalette.blue.shadeDefault,
          ),
  
    ];
    return series;
  }

  static List<dynamic> crearSeriesString(
      String id, String tipoGrafica, List<ElementoSerie> datos) {
    List<charts.Series<ElementoSerie, String>> series = [];
    List<String> grupoSeries = List<String>();
    String serie;
    String serieEncontrada;

    if (tipoGrafica == "barraGrupo" || tipoGrafica == "barraPila") {
      for (ElementoSerie item in datos) {
        if (item.serie != serie) {
          serie = item.serie;
          serieEncontrada =
              grupoSeries.firstWhere((s) => s == serie, orElse: () => null);
          if (serieEncontrada == null) grupoSeries.add(serie);
        }
      }
      for (String serie in grupoSeries) {
        List<ElementoSerie> listaSerie =
            datos.where((s) => s.serie == serie).toList();
        series.add(crearSerieString(serie, listaSerie));
      }
    }
    else
      series.add(crearSerieString(id, datos));
    return series;
  }

  static dynamic crearSerieString(String id, List<ElementoSerie> datos) {
    //  cambiar  el no de serie  suere  30
     int numberOfColorsYouWant = 20;
     print( Colores.obtenerColor('Zafiro'))  ;
     print( charts.ColorUtil.fromDartColor(Colors.red) ) ;
     print( Colores.obtenerColorIndex(1))  ;
     print( charts.ColorUtil.fromDartColor(Colores.obtenerColorIndex(1)) ) ;
    

    
    if  (id=="Cuenta")
      return charts.Series(
        // id: id+UniqueKey().toString(),
        id: id,
        data: datos,
        domainFn: (ElementoSerie item, _) => item.titulo,
        measureFn: (ElementoSerie item, _) => item.valor,
        //colorFn: (ElementoSerie item, _) =>  item.colorG,
        //colorFn: (ElementoSerie item, _) =>  item.color!= null? charts.ColorUtil.fromDartColor(item.color): Colors.primaries[Random().nextInt(Colors.primaries.length)], 
        //colorFn:   (ElementoSerie item, index) => charts.ColorUtil.fromDartColor(Colores.obtenerColorIndex(index)),
        colorFn: (ElementoSerie item, index){
            if (item.colorG!= null)
                return  item.colorG;
            else
                return charts.MaterialPalette.teal.makeShades(numberOfColorsYouWant)[index];
        },
        //fillColorFn: (_, __) =>  charts.MaterialPalette.cyan.shadeDefault.lighter,
        labelAccessorFn: (ElementoSerie item, _) => '${item.valor}',
      );
    else
        return charts.Series(
        // id: id+UniqueKey().toString(),
        id: id,
        data: datos,
        domainFn: (ElementoSerie item, _) => item.titulo,
        measureFn: (ElementoSerie item, _) => item.metrica,
        //colorFn: (ElementoSerie item, _) =>  item.colorG,
        //colorFn: (ElementoSerie item, _) =>  item.color!= null? charts.ColorUtil.fromDartColor(item.color): Colors.primaries[Random().nextInt(Colors.primaries.length)], 
        //colorFn:   (ElementoSerie item, index) => charts.ColorUtil.fromDartColor(Colores.obtenerColorIndex(index)),
        colorFn: (ElementoSerie item, index){
            if (item.colorG!= null)
                return  item.colorG;
            else
                return charts.MaterialPalette.teal.makeShades(numberOfColorsYouWant)[index];
        },
        //fillColorFn: (_, __) =>  charts.MaterialPalette.teal.shadeDefault.lighter,
        labelAccessorFn: (ElementoSerie item, _) => '${item.metrica}',
      );  
  }

  //
  //   Graficas
  //
  //


  //
  //   Crear   tipos  de graficas  grafica  
  //
  //
  //   Crear  grafica  de  barras   sencilla
  //
  static Widget CrearBarras(BuildContext context,String id, List<ElementoSerie> datos, Function metodoSeleccion) {
    List<dynamic> series = Grafica.crearSeriesString(id, "barras", datos);
    return Container(
        padding:  new EdgeInsets.only(right: 2.0, bottom: 20.0),
        child: charts.BarChart(
      series,
      animate: true,
      defaultInteractions: true,
      animationDuration: Duration(seconds: 3),
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: metodoSeleccion,
        )
      ],      
      behaviors: [
         new charts.SelectNearest(),
        charts.DomainHighlighter(),
        new charts.SeriesLegend()
     ],
    ));
  }

  //
  //   Crear  grafica  de  Grupo de barras
  //
  static Widget CrearBarrasGrupo(BuildContext context,String id, List<ElementoSerie> datos, Function metodoSeleccion) {
    List<dynamic> series = Grafica.crearSeriesString(id, "barraGrupo", datos);
    return Container(
        child: charts.BarChart(
      series,
      animate: true,
      defaultInteractions: true,
      animationDuration: Duration(seconds: 3),
      barGroupingType: charts.BarGroupingType.grouped,
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: metodoSeleccion,
        )
      ],      
      behaviors: [
        new charts.SelectNearest(),
        charts.DomainHighlighter(),
        new charts.SeriesLegend()
     ],
    ));
  }

  //
  //   Crear  grafica  de PILA de   barras
  //
  static Widget CrearBarrasPila(BuildContext context,String id, List<ElementoSerie> datos, Function metodoSeleccion) {
    List<dynamic> series = Grafica.crearSeriesString(id, "barraPila", datos);
    return Container(
        child: charts.BarChart(
      series,
      animate: true,
      defaultInteractions: true,
      animationDuration: Duration(seconds: 3),
      barGroupingType: charts.BarGroupingType.stacked,
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: metodoSeleccion,
        )
      ],      
      behaviors: [
         new charts.SelectNearest(),
        charts.DomainHighlighter(),
        new charts.SeriesLegend()
     ],
    ));
  }

  //
  //   Crear  grafica  de  Pie
  //

  static Widget CrearPie(BuildContext context,String id, List<ElementoSerie> datos, Function metodoSeleccion) {
    List<charts.Series<ElementoSerie, String>> series = [];
    int fontSize =9;
    if (Responsivo.identifciarDispositivo(context)=="tablet" )
       fontSize=11;
    if (Responsivo.identifciarDispositivo(context)=="pc" )
       fontSize=12;
    series.add(Grafica.crearSerieString(id, datos));
    return Container(
       padding: new EdgeInsets.all(8.0),
        child: charts.PieChart(
      series,
      animate: true,
      defaultInteractions: true,
      animationDuration: Duration(seconds: 3),
      defaultRenderer: new charts.ArcRendererConfig(
          arcRendererDecorators: [
          new charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.auto,
          )
        ],
      ),    
       selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: metodoSeleccion,
        )
      ],
      behaviors: [
        new charts.SelectNearest(),
        charts.DomainHighlighter(),
        new charts.DatumLegend(
          outsideJustification: charts.OutsideJustification.startDrawArea,
          horizontalFirst: false,
          desiredMaxRows: 6,
          cellPadding: new EdgeInsets.only(right: 2.0, bottom: 2.0),
          entryTextStyle: charts.TextStyleSpec(
            color:  charts.MaterialPalette.gray.shadeDefault,
            fontFamily: "Georgia",
            fontSize: fontSize,
          ),
        )
      ],
    ));
  }

  //
  //   Crear  grafica  de  DONA
  //

  static Widget CrearDona(BuildContext context,String id, List<ElementoSerie> datos, Function metodoSeleccion) {
    List<charts.Series<ElementoSerie, String>> series = [];
    int arcWidth =100;
    if (Responsivo.identifciarDispositivo(context)=="tablet" )
       arcWidth=80;
    if (Responsivo.identifciarDispositivo(context)=="tel" )
       arcWidth=70;
    int fontSize =9;
    if (Responsivo.identifciarDispositivo(context)=="tablet" )
       fontSize=11;
    if (Responsivo.identifciarDispositivo(context)=="pc" )
       fontSize=12;       
    series.add(Grafica.crearSerieString(id, datos));
    
    return Container(
      padding: new EdgeInsets.all(1.0),
      //padding: EdgeInsets.only(left: 5.0, right: 35.0,  bottom: 5.0),
      child: charts.PieChart(
      series,
      animate: true,
      defaultInteractions: true,
      animationDuration: Duration(seconds: 3),
      defaultRenderer: new charts.ArcRendererConfig(
        arcWidth: arcWidth,
        arcRendererDecorators: [
          new charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.auto,
          )
        ],
      ),
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: metodoSeleccion,
        )
      ],
      behaviors: [
        new charts.SelectNearest(),
        charts.DomainHighlighter(),
        new charts.DatumLegend(
          outsideJustification: charts.OutsideJustification.startDrawArea,
          horizontalFirst: false,
          desiredMaxRows: 6,
          cellPadding: new EdgeInsets.only(right: 2.0, bottom: 2.0),
          entryTextStyle: charts.TextStyleSpec(
            color: charts.MaterialPalette.gray.shadeDefault,
            fontFamily: "Georgia",
            fontSize: fontSize,
          ),
        )
      ],
    ));
  }

  //
  //   Crear  grafica  de  burbujas
  //
  static Widget CrearLineas(BuildContext context,String id, List<ElementoSerie> datos, Function metodoSeleccion) {
    List<dynamic> series = Grafica.crearSeriesNumerica("y", datos);
    return new charts.LineChart(series, animate: true);
  }

  //
  //   Crear  grafica  de  burbujas
  //
  static Widget CrearArea(BuildContext context,String id, List<ElementoSerie> datos, Function metodoSeleccion) {
    List<dynamic> series = Grafica.crearSeriesNumerica("y", datos);
    return new charts.LineChart(series,
        animate: true,
        defaultRenderer:
            charts.LineRendererConfig(stacked: true, includeArea: true));
  }
  //
  //   Crear  grafica  de  burbujas
  //

  static Widget CrearBurbujas(BuildContext context,List<ElementoSerie> datos, Function metodoSeleccion) {
    List<BubbleNode> list_bubbles = List<BubbleNode>();
    List<Widget> list_valores = List<Widget>();

    list_valores.add(Text(
      "Socios",
      style: TextStyle(
        color: Colors.black,
      ),
    ));
    datos.forEach((ElementoSerie elemento) {
      final bubble = BubbleNode.leaf(
          options: BubbleOptions(color: elemento.color), value: elemento.valor);
      list_bubbles.add(bubble);
      list_valores.add(Text(
        elemento.titulo,
        style: TextStyle(color: Colors.black, backgroundColor: elemento.color),
      ));
    });
    final bubbles = BubbleNode.node(
      children: list_bubbles,
      padding: 5,
    );
    final bubbles_2 = BubbleNode.node(
      padding: 15,
      children: [
        BubbleNode.node(
          padding: 30,
          children: [
            BubbleNode.leaf(
              options: BubbleOptions(
                color: Colors.brown,
              ),
              value: 4159,
            ),
            bubbles,
          ],
        ),
      ],
    );
    return Stack(children: <Widget>[
      Container(
          child: BubbleChartLayout(
        root: bubbles,
      )),
      Container(
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: list_valores,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
              ))),
    ]);
  }

  //
  //   Crear  barra  para  cronograma
  //

  static List<Widget> crearCronograma(BuildContext context,String tipo, List<ElementoSerie> datos) {
    List<Widget> barras = List<Widget>();
    datos.forEach((ElementoSerie elemento) {
      barras.add(Grafica.crearBarraCronograma(
          tipo, elemento.color, elemento.x, elemento.y));
    });
    return barras;
  }

  static Widget crearBarraCronograma(
      String tipo, Color color, double ancho, double alto) {
    Widget barra;
    if (tipo.toLowerCase().contains("v"))
      barra = Column(
        children: <Widget>[
          Container(
              color: color,
              width: ancho,
              height: alto,
              padding: EdgeInsets.all(1.0)),
        ],
      );
    else
      barra = Row(
        children: <Widget>[
          Container(
              color: color,
              width: ancho,
              height: alto,
              padding: EdgeInsets.all(1.0)),
        ],
      );
    return barra;
  }
}



 Widget definirGraficaDinamicamente(BuildContext context,String id, String tipoGrafica, List<ElementoSerie> datos, Function metodoSeleccion ) {

      if (tipoGrafica == "pieNormal") {
        return Grafica.CrearPie( context,id, datos,metodoSeleccion);
      } else if (tipoGrafica == "dona") {
        return Grafica.CrearDona( context,id, datos,metodoSeleccion);
      } else if (tipoGrafica == "burbuja") {
        return Grafica.CrearBurbujas( context,datos,metodoSeleccion);
      } else if (tipoGrafica == "barra") {
        return Grafica.CrearBarras( context,id, datos,metodoSeleccion);
      } else if (tipoGrafica == "barraGrupo") {
        return Grafica.CrearBarrasGrupo( context,id, datos,metodoSeleccion);
      } else if (tipoGrafica == "barraPila") {
        return Grafica.CrearBarrasPila( context,id, datos,metodoSeleccion);
      } else if (tipoGrafica == "lineaArea") {
        return Grafica.CrearArea( context,id, datos,metodoSeleccion);
      } else if (tipoGrafica == "linea") {
        return Grafica.CrearLineas( context,id, datos,metodoSeleccion);
      }

      //else if (tipoGrafica == "cronogramaVertical")
      //   return Container(
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: Grafica.crearCronograma("v", datos),
      //     ),
      //   );
      // if (tipoGrafica == "cronogramaHorizontal")
      //   return Container(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: Grafica.crearCronograma("h", datos),
      //     ),
      //   );

      // else if (tipoGrafica == "area") {
      //   Map<DateTime, double> line1 = createLine2();
      //   Map<DateTime, double> line2 = createLine2_2();

      //   LineChart chart;

      //   chart = AreaLineChart.fromDateTimeMaps(
      //       [line1], [Colors.red.shade900], ['C'],
      //       gradients: [Pair(Colors.yellow.shade400, Colors.red.shade700)]);
      //   return Container(
      //       child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: AnimatedLineChart(
      //       chart,
      //       key: UniqueKey(),
      //     ),
      //   ));
      // }

      //   else if (tipoGrafica == "pie") {
      //     Map<String, double> dataMap = new Map();
      //     dataMap.putIfAbsent("Flutter", () => 5);
      //     dataMap.putIfAbsent("React", () => 3);
      //     dataMap.putIfAbsent("Xamarin", () => 2);
      //     dataMap.putIfAbsent("Ionic", () => 2);

      //     List<Color> colorList = [
      //       Colors.red,
      //       Colors.green,
      //       Colors.blue,
      //       Colors.yellow,
      //     ];

      //     return Container(
      //         //child: charts.BarChart(series, animate: true),
      //         child: PieChart(
      //       dataMap: dataMap,
      //       animationDuration: Duration(milliseconds: 800),
      //       chartLegendSpacing: 32.0,
      //       chartRadius: MediaQuery.of(context).size.width / 2.7,
      //       // showChartValuesInPercentage: true,
      //       // showChartValues: true,
      //       // showChartValuesOutside: false,
      //       // chartValueBackgroundColor: Colors.grey[200],
      //       // colorList: colorList,
      //       // showLegends: true,
      //       // legendPosition: LegendPosition.right,
      //       // decimalPlaces: 1,
      //       // showChartValueLabel: true,
      //       // initialAngle: 0,
      //       // chartValueStyle: defaultChartValueStyle.copyWith(
      //       //   color: Colors.blueGrey[900].withOpacity(0.9),
      //       // ),
      //       chartType: ChartType.disc,
      //       // chartType: ChartType.ring,
      //       //showChartValuesOutside: true,
      //     ));
      // }

}



// Map<DateTime, double> createLine2() {
//   Map<DateTime, double> data = {};
//   data[DateTime.now().subtract(Duration(minutes: 40))] = 10.0;
//   data[DateTime.now().subtract(Duration(minutes: 30))] = 14.0;
//   data[DateTime.now().subtract(Duration(minutes: 25))] = 19.0;
//   data[DateTime.now().subtract(Duration(minutes: 20))] = 21.0;
//   data[DateTime.now().subtract(Duration(minutes: 15))] = 27.0;
//   data[DateTime.now().subtract(Duration(minutes: 10))] = 29.0;
//   data[DateTime.now().subtract(Duration(minutes: 5))] = 190.0;
//   return data;
// }

// Map<DateTime, double> createLine2_2() {
//   Map<DateTime, double> data = {};
//   data[DateTime.now().subtract(Duration(minutes: 40))] = 17.0;
//   data[DateTime.now().subtract(Duration(minutes: 30))] = 30.0;
//   data[DateTime.now().subtract(Duration(minutes: 25))] = 47.0;
//   data[DateTime.now().subtract(Duration(minutes: 20))] = 29.0;
//   data[DateTime.now().subtract(Duration(minutes: 15))] = 23.0;
//   data[DateTime.now().subtract(Duration(minutes: 10))] = 47.0;
//   data[DateTime.now().subtract(Duration(minutes: 5))] = 96.0;
//   return data;
// }

