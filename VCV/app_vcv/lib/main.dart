import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:signature/signature.dart';
import 'package:app_vcv/nucleo/paquetesExternos/ui/controles/firma.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Firma firma = Firma();

  var _controller;

  // var _controller = SignatureController(
  //   penStrokeWidth: 5,
  //   penColor: Colors.red,
  //   exportBackgroundColor: Colors.blue,
  // );
  var signatureCanvas;
  var exportedPoints;

  Uint8List? imageExport;

  void initState() {
    assert(_counter == 0);

    _controller = firma.crearContralador(
        penStrokeWidth: 5,
        penColor: Colors.red,
        exportBackgroundColor: Colors.green);

    signatureCanvas = firma.crearSignature(
        controller: firma.obetenerControlador,
        width: 300,
        height: 300,
        backgroundColor: Colors.black);

    // signatureCanvas = Signature(
    //   controller: _controller,
    //   width: 300,
    //   height: 300,
    //   backgroundColor: Colors.lightBlueAccent,
    // );
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // firma
            signatureCanvas,
            // firma.obetenerSignature(),

            // exportar
            ElevatedButton(
                onPressed: () async {
                  imageExport = await firma.obetenerControlador.toPngBytes();
                  // exportedPoints =  firma.obetenerControlador.points;
                  // _controller = SignatureController(points: exportedPoints);
                  setState(() {});
                  // _controller.clear();
                },
                child: Text('export')),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  imageExport = await _controller.toPngBytes();

                  String dir = (await getApplicationDocumentsDirectory()).path;

                  File file = File("$dir/" + 'myimage' + ".png");
                  await file.writeAsBytes(imageExport!);
                  final imageExport2 = await _controller.toPngBytes();
                  String nombre = 'firma.png';

                  // final estatus = await Permission.storage.status;
                  // if (estatus.isGranted) await Permission.storage.request();

                  // var resultado = await ImageGallerySaver.saveImage(
                  //     imageExport2,
                  //     name: nombre);

                  // print(resultado);

                  print(file.path);
                  firma.guardar(nombre, imageExport2);
                  // exportedPoints = firma.obetenerControlador..points;
                  // _controller = SignatureController(points: exportedPoints);
                  setState(() {});
                  // _controller.clear();
                },
                child: Text('save')),

            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  firma.obetenerControlador.clear();
                },
                child: Text('limpiar')),
            if (imageExport != null) Image.memory(imageExport!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
