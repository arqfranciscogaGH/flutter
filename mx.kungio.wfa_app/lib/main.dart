//  librerias internas de flutter


import 'package:flutter/material.dart';

//  librerias importadas flutter
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:provider/provider.dart';

//  librerias  proyecto

import 'src/aplicacion/configuracion/configuracionAplicacion.dart';
import 'src/nucleo/ui/ui.dart';
import 'src/aplicacion/contexto/contexto.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Inicio.iniciar();

    // Firebase.initializeApp();

    // Preferencias.iniciar() ;
    /* return  MultiProvider (
        providers: [ ChangeNotifierProvider(create :(_)=> FTConsultaControlador()),
        
       ],
   
     child: */
     String paginaInicio="pagina_inicio";
     if  (Sesion.idUsuario==0)
        paginaInicio="pagina_acceso";
     return  new  DynamicTheme(
      //defaultBrightness: Brightness.light,
      data: (brightness) => Tema.creaTema("default", context),
      /* new ThemeData(
        //primarySwatch: Colors.red,
        primaryColor:Tema.obtenerColorTema(),
        //backgroundColor: Colors.green,
        brightness: Tema.obtenerBrilloTema(),
      ), */
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ' A F T  KunGio ',
          supportedLocales: [Locale('en'), Locale('es')],
          localizationsDelegates: [
            IdiomaAplicacion.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: theme,
          /* theme: ThemeData(
                           primarySwatch: Colores.obtener(Configuracion.tema) ,
                        ), */
          routes: ObtenerRutas(),
          initialRoute: paginaInicio,
          // onGenerateRoute: (settings) {
          //     // generarRuta(context,settings);
          // },
        );
      },
     //),
    );
  }
}
