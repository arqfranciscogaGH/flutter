
//  librerias internas de flutter

import 'package:flutter/material.dart';


//  librerias importadas flutter


//  librerias  proyecto

import '../../configuracion/configuracionAplicacion.dart';
import '../../../nucleo/ui/ui.dart';


class vista_tarjeta extends StatelessWidget
{ 
  String id;
  String titulo;
  String subTitulo;
  String rutaPagina;
  Function accion;
  String rutaIcono;
  String vista;
  Color color;
  vista_tarjeta ( {  this.id,this.titulo, this.subTitulo,this.color, this.vista, this.rutaIcono, this.rutaPagina,  this.accion});

  @override
  Widget build ( BuildContext context)
  {
     double valor =0.4 ;
     return  vista1(context);
     
    //  Card(
    
    // // Con esta propiedad modificamos la forma de nuestro card
    // // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    
    // // Con esta propiedad agregamos margen a nuestro Card
    // // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
    // margin: EdgeInsets.all(15),
    
    // // Con esta propiedad agregamos elevación a nuestro card
    // // La sombra que tiene el Card aumentará
    // elevation: 10,
    

    // // La propiedad child anida un widget en su interior
    // // Usamos columna para ordenar un ListTile y una fila con botones
    // child: 
        //  Column( children: <Widget>[

      // GestureDetector(
      //         onTap: () { },
      //         child:
      //           // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
      //           ListTile(
      //             //contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
      //             title: Text(this.vista),
      //             subtitle: Text(
      //                 ' Seleccione la vista'),
      //             leading: Iconos.crear(this.vista ),
      //           ),
      // ),
      // Usamos una fila para ordenar los botones del card
      // Row(
      //     // mainAxisAlignment: MainAxisAlignment.end,
      //     children: <Widget>[
      //       Text(this.vista),
      //      // IconButton( icon:Icon(Icons.home)  ,   onPressed: () => {}),
      //       GestureDetector(
      //         onTap: () {
      //           print ("tab"+this.rutaPagina);
      //           Accion.hacer(context, OpcionesMenus.obtener(this.rutaPagina));
      //          },
      //         child:
      //             Container(
      //               width: 20,
      //               height: 20,
      //               child:  Image.asset ( this.rutaIcono, )
      //             )
      //       )
      //     ],
      //  )

    //   ],
    // ),

  // Transform(transform: Matrix4.identity()..setEntry(3, 2, 0.001)..translate(31.0)..scale(valor),
  // child:


 
    // return  Container(
    //   width: 50,
    //   height: 50,
    //   margin: EdgeInsets.only(top:20),
    //   decoration: BoxDecoration( borderRadius: BorderRadius.circular(30) , color:this.color,),
      
    // );
    }
    Widget vista1(BuildContext context)
    {
      return 
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          Text(this.titulo, style: TextStyle(fontWeight: FontWeight.w800),),
          GestureDetector(
                onTap: () {
                  print ("tab"+this.rutaPagina);

                  if( this.accion!=null)
                        this.accion(this.id);
                  else if( this.rutaPagina!=null && this.rutaPagina!="")      
                       Accion.hacer(context, OpcionesMenus.obtener(this.rutaPagina));
                  },
                child:
              Container( 
                            padding: EdgeInsets.only(top:5) ,
                            margin: EdgeInsets.only(top:5),
                            //decoration: BoxDecoration( borderRadius: BorderRadius.circular(3) , color:this.color),
                            width: 200,
                            height: 170,
                            child:  Image.asset ( this.rutaIcono, )
              )
          )
        ]
      );
    }
  
}