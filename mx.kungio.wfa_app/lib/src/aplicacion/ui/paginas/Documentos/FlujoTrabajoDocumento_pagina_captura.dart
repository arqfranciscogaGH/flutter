//  librerias internas de flutter

import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// import 'package:file_picker/file_picker.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'FlujoTrabajoDocumentoUI.dart';
import 'FlujoTrabajoDocumento_captura.dart';

class FlujoTrabajoDocumento_pagina_captura extends StatefulWidget {
  FlujoTrabajoDocumento_pagina_captura(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.activarAcciones,
      this.accionPagina})
      : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = "";

  bool activarAcciones = false;
  static String ruta = "FlujoTrabajoDocumento_pagina_captura";

  @override
  _FlujoTrabajoDocumento_pagina_captura createState() =>
      _FlujoTrabajoDocumento_pagina_captura();
}

class _FlujoTrabajoDocumento_pagina_captura
    extends State<FlujoTrabajoDocumento_pagina_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  FlujoTrabajoDocumento entidadCaptura;
  List<FlujoTrabajoDocumento> listaEntidad;
  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // captura

  GlobalKey<FormState> keyFormulario;

  //  Acciones

  ElementoLista accionGuardar;

  //  provider
  FlujoTrabajoDocumentoControlador provider;

  //  Interfaz  comun
  FlujoTrabajoDocumentoUI ui;

  //  controladores

  //  otros

  String url = "";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = FlujoTrabajoDocumento_pagina_captura.ruta;
    provider = FlujoTrabajoDocumentoControlador();
    provider.asignarParametros(null, "prueba");
    ui = FlujoTrabajoDocumentoUI(provider: provider);
    accionGuardar = ElementoLista(
        id: 4,
        icono: "save",
        ruta: widget.paginaSiguiente,
        accion: ui.guardarEntidad,
        callBackAccion: ui.respuestaInsertar,
        callBackAccion2: ui.respuestaModificar,
        callBackAccion3: ui.respuestaGuardar,
        argumento: widget.pagina);
    keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);
    //  iniciar y consultar lista para obtener elemento y obtener el elemento que insertará
    entidadCaptura = provider.entidad;
    listaEntidad = provider.lista;
    // url = ui.generarUrl(entidadCaptura);
   
  }

  @override
  void dispose() {
    super.dispose();
    provider.dispose();
  }

  //
  //   construir  interfaz de FlujoTrabajoDocumento
  //
  @override
  Widget build(BuildContext context) {
    //  contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    idioma = IdiomaAplicacion.obtener(context, idioma);
    ui.iniciar(context, scaffoldKey, idioma, widget);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    // Vinculo.visitarSitio(url);
    return ChangeNotifierProvider.value(
        value: provider,
        child: Scaffold(
          key: scaffoldKey,
          appBar: GradientAppBar(
            title: Text(widget.titulo),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colores.obtenerColor(Configuracion.colorSecundario)
            ]),
            actions: <Widget>[
/*               IconButton(
                icon: Icon(Icons.photo_size_select_actual),
                onPressed: () {
                   //  seleccionarDocumento();
                  ui.seleccionarFoto(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  //ui.tomarFoto(context);
                  //Vinculo.visitarSitio('http://kungio.mx/CargarDocs.aspx?id=0&idReferencia=1&idDocumento=2&nombreDocumento=Acta');
                  Vinculo.visitarSitio(url);
                  
                },
              ), */
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  crearPdf();
                  // _compartir(provider.entidad);
                },
              ),
            ],
          ),

          body: Stack(children: <Widget>[
            FlujoTrabajoDocumento_captura(
                pagina: widget.pagina,
                keyFormulario: keyFormulario,
                paginaSiguiente: widget.paginaSiguiente,
                paginaAnterior: widget.paginaAnterior,
                activarAcciones: !(widget.activarAcciones ?? true),
                accionPagina: widget.accionPagina),
            // WebView( initialUrl: url),
          ]),

          // body: WebView(
          //      initialUrl: 'https://flutter.dev',
          // ),
          // body: FlujoTrabajoDocumento_captura(
          //     pagina: widget.pagina,
          //     keyFormulario: keyFormulario,
          //     paginaSiguiente: widget.paginaSiguiente,
          //     paginaAnterior: widget.paginaAnterior,
          //     activarAcciones: !(widget.activarAcciones ?? true),
          //     accionPagina: widget.accionPagina),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ui.crearBotonesAcciones(
              context, widget.activarAcciones ?? true, accionGuardar),
        ));
  }

// seleccionarDocumento  () async
// {
//     FilePickerResult result = await FilePicker.platform.pickFiles();

//     if(result != null) {
//       File file = File(result.files.single.path);
//     }

// }

  //
  //   control  de estado y validaciones
  //
  _compartir(FlujoTrabajoDocumento entidadCaptura) async {
    String ruta = "http://kungio.mx/docs/" + entidadCaptura.ruta;
    if (ruta != null && ruta != "") {
      Compartir.urlImagen(
          titulo: "Compartir Documento",
          texto: "Documento:" + entidadCaptura.nombre,
          nombre: entidadCaptura.nombre + ".pdf",
          formato: '*/*',
          urlFoto: ruta);
    }
  }

  compartirUrl(FlujoTrabajoDocumento entidadCaptura) async {
    var request = await HttpClient().getUrl(Uri.parse(
        'https://shop.esys.eu/media/image/6f/8f/af/amlog_transport-berwachung.jpg'));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    //await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg');
  }

  Future<void> crearPdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );

    guardarPdf(nombre: 'example.pdf', pdf: pdf);
  }

  Future<File> guardarPdf({
    String nombre,
    pw.Document pdf,
  }) async {
    //Future<Uint8List> bytes= pdf.save();
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    print('${dir.path}/$nombre');
    final file = File('${dir.path}/$nombre');
    //await file.writeAsBytes(bytes);
    await file.writeAsBytes(bytes, flush: true);
    compartirPdf(bytes, 'documento.pdf');
    return file;
  }

  Future<File> guardarPdf2({
    String nombre,
    pw.Document pdf,
  }) async {
    //Future<Uint8List> bytes= pdf.save();
    final bytes = await pdf.save();
    final dir = await getExternalStorageDirectory();
    print('${dir.path}/$nombre');
    final file = File('${dir.path}/$nombre');
    await file.writeAsBytes(bytes, flush: true);
    //compartirPdf(bytes, 'documento.pdf');
    return file;
  }

  compartirPdf(bytesPdf, String nombre) {
    // Printing.sharePdf(bytes: bytesPdf, filename: nombre);
  }
}
