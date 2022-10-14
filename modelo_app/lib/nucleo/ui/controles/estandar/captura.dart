
//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

//  librerias importadas flutter
import 'package:intl/intl.dart';
// import 'package:intl/intl_browser.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

//  librerias  proyecto


import '../../../nucleo.dart';
import '../../color/color.dart';
// import '../../comun/comun.dart';
// import '../../Iconos/iconos.dart';
// import '../../../../nucleo/negocio/modelo/ModeloBase.dart';
// import 'decoracion.dart';

//import '../../esp/videos.dart';

import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

class Captura {
  static Widget mostrarFormulario(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function metodocambiarValor,
      Function validar,
      Function metodoDefinicionControles,
      dynamic entidadCaptura) {

    
    return Form(
      key: formKey,
      child: ListView(
        // shrinkWrap: true,
        // padding: EdgeInsets.all(1.0),
        children: metodoDefinicionControles(
            context, formKey, metodocambiarValor, validar, entidadCaptura),
      ),
    );
  }

  static Widget mostrarFormularioColumnas(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function metodocambiarValor,
      Function validar,
      Function metodoDefinicionControles,
      dynamic entidadCaptura) {
    return Form(
      key: formKey,
      child: Column(
        // shrinkWrap: true,
        // padding: EdgeInsets.all(1.0),
        children: metodoDefinicionControles(
            context, formKey, metodocambiarValor, validar, entidadCaptura),
      ),
    );
  }
}

List<Widget> cargarControlesCaptura(
    BuildContext context,
    List<Control> controles,
    dynamic idioma,
    String pagina,
    Function metooCambiarValor,
    Function metodoValidar,
    List<Widget> widgets   ) {
  controles.forEach((Control control) {
    control = control.asignar(
        idioma, pagina, control.valor, metooCambiarValor, metodoValidar);
  });
  return crearControlesCaptura(context, controles, widgets);
}

List<Widget> crearControlesCaptura(
    BuildContext context, List<Control> controles,
    List<Widget> widgets) {
  List<ElementoLista> lista;
  if (widgets == null) widgets = [];
  controles.forEach((Control control) {
    if (control.tipo == eTipoControl.cajaTexto)
      widgets.add(crearCajaTexto(context, control));
    else if (control.tipo == eTipoControl.etiqueta)
      widgets.add(crearEtiqueta(context, control));
    else if (control.tipo == eTipoControl.cajaTextoForma)
      widgets.add(crearCajaTextoForma(context, control));
    else if (control.tipo == eTipoControl.calendario || control.tipo == eTipoControl.fechaSelector  || control.tipo == eTipoControl.horaSelector )
      widgets.add(crearCajaTexto(context, control));
     else if (control.tipo == eTipoControl.horaSelectorCupertino || control.tipo == eTipoControl.fechaSelectorCupertino )
      widgets.add(crearCajaTexto(context, control));
    else if (control.tipo == eTipoControl.apagador)
      widgets.add(crearSwitch(context, control));
    else if (control.tipo == eTipoControl.listaDespegable)
      widgets.add(crearDropdown(context, control, control.lista!));
    else if (control.tipo == eTipoControl.listaDespegableFija)
      widgets.add(crearDropdownFijo(context, control, control.lista!));
    else if (control.tipo == eTipoControl.radioHorizontal)
      widgets.add(crearRadioHorizontal(context, control, control.lista!));
    else if (control.tipo == eTipoControl.radioVertical)
      widgets.add(crearRadioVertical(context, control, control.lista!));
    else if (control.tipo == eTipoControl.verificadorVertical)
      widgets.add(crearVerficadorVertical(context, control, control.lista!));
    else if (control.tipo == eTipoControl.verificadorHorizontal)
      widgets.add(crearVerficadorHorizontal(context, control, control.lista!));
    else if (control.tipo == eTipoControl.selectorDeslizante)
      widgets.add(crearSelectorDeslizante(context, control));



    /*  

      else if (control.tipo == eTipoControl.VideoSimple) {
        widgets.add(crearCajaTextoForma(context, control));
        widgets.add(
            ReproductorVideoSimple(titulo: control.nombre, ruta: control.valor));
      } 

    */

    /*  

      else if (control.tipo == eTipoControl.VideoMejorado) {
          widgets.add(crearCajaTextoForma(context, control));
          widgets.add(ReproductorVideoSimple(titulo: control.nombre ,ruta: control.valor));  
          //widgets.add(ReproductorVideoMejorado(titulo: control.nombre ,ruta: control.valor));
            
        } else if (control.tipo == eTipoControl.VideoPersonalizado) {
          widgets.add(crearCajaTextoForma(context, control));
          //widgets.add(ReproductorVideoPersonalizado(titulo: control.nombre ,ruta: control.valor));
        }    

     */
    else if (control.tipo == eTipoControl.foto)
      widgets.add(crearFoto(context, control));
  });
  return widgets;
}

Widget crearEtiqueta(BuildContext context, Control control) {
  return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(children: [
      SizedBox(
        width: 38.0,
        height: 30.0,
        //child: const Card(child: Text('')),
      ),
      Text(
        control.textoEtiqueta!,
        textAlign: TextAlign.left,

        //Theme.of(context).
        //style:Theme.of(context).textTheme.display1,
        // DefaultTextStyle.of(context).style,
        //TextStyle(fontWeight: FontWeight.normal, fontFamily:  'Monospace', fontSize: DefaultTextStyle.of(context).style.fontSize ),
      ),
    ]),
    Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
          Icono.crear(control.icono! /* , Theme.of(context).disabledColor  */ ),
          SizedBox(
            width: 16.0,
            height: 30.0,
            //child: const Card(child: Text('')),
          ),
          new Expanded(
              child: Container(
                  //width: MediaQuery.of(context).size.width -76,
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.all(0.0),
                  decoration: crearDecoracionContenedor(context, control),
                  child: Text(
                    control.valor==null?"":control.valor,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    //style: TextStyle(fontWeight: FontWeight.bold),
                  )))
        ]))
  ]));
}

// este metodo funciona el eento tap con crearCajaTextoForma
/* Widget crearFecha(BuildContext context ,Control control)
{

  Widget fecha;
  if (control.tipo.contains("FECHA"))
  {
      if (control.tipo.contains("FECHA_CALENDARIO"))
          fecha=crearCajaTextoForma(context , control);
      else
          fecha=crearCajaTextoForma(context , control);
  }
  return GestureDetector(
               onTap: (){
                          if (control.tipo.contains("FECHA"))
                          {
                              FocusScope.of(context).requestFocus(new FocusNode());
                              if (control.tipo.contains("FECHA_CALENDARIO"))
                                  seleccionarFechaBotones( context, control );    
                              else
                                  seleccionarFechaCalendario( context, control );             
                          }
                        },                          
                child:fecha,

         );
} */
seleccionarFechaCalendario(BuildContext context, Control control) async {
      Duration duration = new Duration(days: 365*100);
      DateTime? fechaSeleccionada = await showDatePicker(
                    context: context,
                    // locale : const Locale("fr","FR"),
                    helpText: 'Fecha',
                    confirmText:'Aceptar',
                     cancelText:'Cancelar',
                    // locale: Locale( 'es') ,
                    // locale : const Locale("fr","FR"),
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(duration),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime.now().add(duration),  );
    control.accion!(control, asignarFecha(control, fechaSeleccionada));    
               
  // DateTime fechaSeleccionada = await showDatePicker(
  //   context: context,

  //   initialDate: new DateTime.now(),
  //   // firstDate:DateTime(2020, 1, 1),
  //   // lastDate: DateTime(2030, 11, 1),
  //   firstDate: DateTime.now().subtract(duration),
  //   lastDate: DateTime.now().add(duration),
  //   //si  egrega esta linea se genera error
  // );
  // control.accion!(control, asignarFecha(control, fechaSeleccionada));
}

seleccionarFechaBotones(BuildContext context, Control control) async {

      // DatePicker.showTimePicker(context, showTitleActions: true,
      //           onChanged: (date) {
      //         print('change $date in time zone ' +
      //             date.timeZoneOffset.inHours.toString());
      //       }, onConfirm: (date) {
      //         print('confirm $date');
      //       }, currentTime: DateTime.now());

  

   Duration duration = new Duration(days: 365*100);

   DateTime fechaSeleccionada;
   DatePicker.showDatePicker(context,
               showTitleActions: true,
          locale: LocaleType.es,
          currentTime: DateTime.now(),
          minTime: DateTime.now().subtract(duration),  
          maxTime: DateTime.now().add(duration),
          //maxTime: DateTime(2022, 12, 31),
          
         
          onChanged: (fecha) {
            print('change $fecha');
            fechaSeleccionada = fecha;
        },
        onConfirm: (fecha) {
            print('confirm $fecha');
            fechaSeleccionada = fecha;
            asignarFecha(control, fechaSeleccionada);
            control.accion!(control, asignarFecha(control, fechaSeleccionada));
        },
      );
      
  
}

  // Show the modal that contains the CupertinoDatePicker
  void seleccionarFechaHoraCupertino(BuildContext context, Control control) async {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 500,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        //maximumYear: 2018,
                        minimumYear: 1900,
                        mode:  control.tipo==eTipoControl.fechaSelectorCupertino?CupertinoDatePickerMode.date: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (fechaSeleccionada) {
                            control.valor=fechaSeleccionada;
                         }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('Aceptar'),
                    onPressed: () 
                    {
                         control.accion!(control, asignarFecha(control,control.valor));
                         Navigator.of(context).pop();
                    } ,
                  )
                ],
              ),
            ));
  }

String asignarFecha(Control control, DateTime? fechaSeleccionada) {
  String cadenafecha = "";
  if (fechaSeleccionada != null && fechaSeleccionada != "") {
    // cadenafecha = DateFormat('MM-dd-yyyy',Intl.defaultLocale ).format(fechaSeleccionada);
    if  (control.tipo== eTipoControl.fechaSelector || control.tipo== eTipoControl.fechaSelectorCupertino || control.tipo== eTipoControl.calendario  )
        cadenafecha = DateFormat(ParametrosSistema.formatoFecha).format(fechaSeleccionada);
    else
        cadenafecha = DateFormat(ParametrosSistema.formatoHora).format(fechaSeleccionada);
    control.valor = cadenafecha;
    if (control.controlEdicion != null)
      control.controlEdicion!.text = cadenafecha;
    // DateTime fecha = DateTime.parse(cadenafecha);
  }
  return cadenafecha;
}



Widget crearCajaTexto(BuildContext context, Control control) {
  // este  control requiere  TextEditingController _controller1 = new TextEditingController();
  // este  control NO ejecuta cuando el metodo validar cuanso se ejecuta al guardar formKey.currentState.validate()
  if (control.controlEdicion != null && control.valor!=null)
    control.controlEdicion!.text = control.valor;
  final Cajatexto = TextField(
    // autofocus: true,
    enableInteractiveSelection: control.tipo == eTipoControl.calendario ||
            control.tipo == eTipoControl.fechaSelector
        ? false
        : true,
    controller: control.controlEdicion,
    obscureText: control.protegerTextoEscrito! != null
        ? control.protegerTextoEscrito!
        : false,
    textCapitalization: (control.textoCapitalizacion! != null)
        ? control.textoCapitalizacion!
        : TextCapitalization.none,
    //keyboardType: (control.tipoEntrada !=null)?control.tipoEntrada : TextInputType.text,
    decoration: crearDecoracionInput(control),
    onTap: () {
      if (control.tipo == eTipoControl.calendario || control.tipo == eTipoControl.fechaSelector || control.tipo == eTipoControl.horaSelector 
      || control.tipo == eTipoControl.fechaSelectorCupertino || control.tipo == eTipoControl.horaSelectorCupertino ) {
        FocusScope.of(context).requestFocus(new FocusNode());
        if (control.tipo == eTipoControl.calendario)
          seleccionarFechaCalendario(context, control);
        else if (control.tipo == eTipoControl.fechaSelector)
          seleccionarFechaBotones(context, control);
        else if (control.tipo == eTipoControl.horaSelector)
          seleccionarFechaBotones(context, control);          
        else if (control.tipo == eTipoControl.fechaSelectorCupertino)
          seleccionarFechaHoraCupertino(context, control); 
        else if (control.tipo == eTipoControl.horaSelectorCupertino)
          seleccionarFechaHoraCupertino(context, control);  
      }
    },
    // se ejecuta cuando se termina la captura
    onSubmitted: (valorIngresado) {
      control.valor = valorIngresado;
      control.accion!(control, valorIngresado);
    },
  );

  return Cajatexto;
}

Widget crearCajaTextoForma(BuildContext context, Control control) {
  // este NO control requiere   TextEditingController _controller1 = new TextEditingController();
  // if (control.controlEdicion!=null)
  //   control.controlEdicion.text = control.valor;
  // if (control.valor != null) print(control.valor ?? control.valor);
  // if (control.controlEdicion != null)
  //   print(
  //     control.controlEdicion.text,
  //   );
  Widget Cajatexto = TextFormField(
    // autofocus: true,
    initialValue: control.valor != null ? control.valor : null,
    // controller: control.controlEdicion != null && control.valor == null
    //     ? control.controlEdicion
    //     : null,
    enableInteractiveSelection: control.tipo == eTipoControl.calendario ||
            control.tipo == eTipoControl.fechaSelector ||
            control.tipo == eTipoControl.fechaSelectorCupertino ||
            control.tipo == eTipoControl.horaSelectorCupertino  ||   
            control.tipo == eTipoControl.horaSelector
        ? false
        : true,
    obscureText: control.protegerTextoEscrito! != null
        ? control.protegerTextoEscrito!
        : false,
    textCapitalization: (control.textoCapitalizacion! != null)
        ? control.textoCapitalizacion!
        : TextCapitalization.none,
    keyboardType: (control.tipoEntrada != null)
        ? control.tipoEntrada
        : TextInputType.text,
    minLines: 1,
    maxLines: control.protegerTextoEscrito != null ? 1 : 5,
    decoration: crearDecoracionInput(control),
    // se ejecuta cuando se termina la captura
    onFieldSubmitted: (valorIngresado) {
      control.valor = valorIngresado;
      control.accion!(control, valorIngresado);
    },
    // se ejecuta cuando el metodo   formKey.currentState.save();  !formKey.currentState.validate()
    onSaved: (valorIngresado) {
      control.valor = valorIngresado;
      control.accion!(control, valorIngresado);
    },
    // se ejecuta cuando el metodo   formKey.currentState.validate()
    validator: (valorIngresado) {
      return control.accionValidacion!(control, valorIngresado);
    },
  );

  return Cajatexto;
}

Widget crearDropdownFijo(
    BuildContext context, Control control, List<ElementoLista> lista) {

  if  (control.valor.runtimeType.toString()=="String"  )    
      return DropdownButton<String>(
        value: control.valor,
        items: obtenerLista(lista),
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (valorIngresado) {
          control.valor = valorIngresado;
          if (control.controlEdicion != null)
            control.controlEdicion!.text = valorIngresado.toString();

          control.accion!(control, valorIngresado);
        },
      );
    else
     return DropdownButton<int>(
      value: control.valor,
      items: obtenerListaInt(lista),
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (valorIngresado) {
        control.valor = valorIngresado;
        if (control.controlEdicion != null)
          control.controlEdicion!.text = valorIngresado.toString();

        control.accion!(control, valorIngresado);
      },
    );   
}

Widget crearDropdown(
    BuildContext context, Control control, List<ElementoLista> lista) {
  dynamic  valorInicial = control.valor;
  if (lista != null && lista.length > 0) {
    print (control.valor.runtimeType.toString() );
    if  (control.valor.runtimeType.toString()=="String"  )
        return /*  Row(

                    children: <Widget>[ */
            //control.icono!=null ?Iconos.crear(control.icono): Icon(Icons.select_all),
    /*                   SizedBox(
                          width: 16.0,
                          height: 30.0,
                          child: const Card(child: Text('')),
                        ), */
    /*                     Container(
                            width: MediaQuery.of(context).size.width -76,
                            margin: const EdgeInsets.all(2.0),
                            padding: const EdgeInsets.all(1.0),  
                            //decoration:  crearDecoracionContenedor(control), 
                                  child: */
            DropdownButtonFormField<String>(
          //elevation: 5,

          /*               underline: Container(
                                        decoration:  crearCajaDecoracion(control.borde),
                                      ), */
          decoration: crearDecoracionInput(control),
          value: valorInicial,
          items: obtenerLista(lista),
          onChanged: (valorIngresado) {
            valorInicial = valorIngresado;
            control.valor = valorIngresado;
            if (control.controlEdicion != null)
              control.controlEdicion!.text = valorIngresado.toString();

            control.accion!(control, valorIngresado);
          },
          //)
          // ),
          //],
      );
      else
        return   DropdownButtonFormField<int>(
        //elevation: 5,

        /*               underline: Container(
                                      decoration:  crearCajaDecoracion(control.borde),
                                    ), */
        decoration: crearDecoracionInput(control),
        value: valorInicial,
        items: obtenerListaInt(lista),
        onChanged: (valorIngresado) {
          valorInicial = valorIngresado;
          control.valor = valorIngresado;
          if (control.controlEdicion != null)
            control.controlEdicion!.text = valorIngresado.toString();

          control.accion!(control, valorIngresado);
        },
      );
   } else
    return Text("No hay elementos");
}

List<DropdownMenuItem<String>> obtenerLista(List<ElementoLista> lista) {
  List<DropdownMenuItem<String>> listaItems = [];
  lista.forEach((ElementoLista elemento) {
    listaItems.add(DropdownMenuItem(
      child: Text(elemento.titulo!),
      value: elemento.valor ?? elemento.titulo,
    ));
  });
  return listaItems;
}

List<DropdownMenuItem<int>> obtenerListaInt(List<ElementoLista> lista) {
  List<DropdownMenuItem<int>> listaItems = [];
  lista.forEach((ElementoLista elemento) {
    listaItems.add(DropdownMenuItem(
      child: Text(elemento.titulo!),
      value: elemento.valor ?? elemento.titulo,
    ));
  });
  return listaItems;
}

Widget crearSwitch(BuildContext context, Control control) {
  return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
        Icono.crear(control.icono! /* , Theme.of(context).disabledColor  */ ),
        SizedBox(
          width: 16.0,
          height: 30.0,
          //child: const Card(child: Text('')),
        ),
        new Expanded(
            child: Container(
                //width: MediaQuery.of(context).size.width -76,
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(0.0),
                decoration: crearDecoracionContenedor(context, control),
                child: SwitchListTile(
                  value: control.valor,
                  title: Text(control.textoEtiqueta!),
                  //secondary: Iconos.crear(control.icono),
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (valorIngresado) {
                    control.valor = valorIngresado;
                    control.accion!(control, valorIngresado);
                  },
                )))
      ]));
}

Widget crearRadioHorizontal(
    BuildContext context, Control control, List<ElementoLista> lista) {
  return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
        Icono.crear(control.icono! /* , Theme.of(context).disabledColor  */  ),
        SizedBox(
          width: 16.0,
          height: 30.0,
          //child: const Card(child: Text('')),
        ),
        new Expanded(
            child: Container(
                //width: MediaQuery.of(context).size.width -76,
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(0.0),
                decoration: crearDecoracionContenedor(context, control),
                child: Row(
                    children: crearElementosRadioHorizontal(
                        context, control, lista))))
      ]));
}

Widget crearRadioVertical(
    BuildContext context, Control control, List<ElementoLista> lista) {
  return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
        Icono.crear(control.icono! /* , Theme.of(context).disabledColor  */  ),
        Text(control.textoEtiqueta!),
        Container(
            //width: MediaQuery.of(context).size.width -76,
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(0.0),
            decoration: crearDecoracionContenedor(context, control),
            child: Column(
              children: crearElementosRadioVertical(context, control, lista),
            )),
      ]));
}

List<Widget> crearElementosRadioVertical(
    BuildContext context, Control control, List<ElementoLista> lista) {
  List<Widget> widgets = [];
  for (ElementoLista elemento in lista) {
    widgets.add(
      RadioListTile<ElementoLista>(
        value: elemento.valor!,
        groupValue: control.valor!,
        title: Text(elemento.titulo!),
        //subtitle: Text(elemento.subitulo),
        activeColor: Theme.of(context).backgroundColor,
        onChanged: (valorIngresado) {
          control.valor = valorIngresado;
          control.accion!(control, valorIngresado);
        },
        selected: elemento.valor == control.valor,
      ),
    );
  }
  return widgets;
}

List<Widget> crearElementosRadioHorizontal(
    BuildContext context, Control control, List<ElementoLista> lista) {
  List<Widget> widgets = [];
  for (ElementoLista elemento in lista) {
    widgets.add(
      Radio <ElementoLista>(
        value: elemento.valor,
        groupValue: control.valor,
        //subtitle: Text(elemento.subitulo),
        activeColor: Theme.of(context).backgroundColor,
        onChanged: (valorIngresado) {
          control.valor = valorIngresado;
          control.accion!(control, valorIngresado);
        },
      ),
    );
    widgets.add(Text(elemento.titulo!));
  }
  return widgets;
}

Widget crearVerficadorHorizontal(
    BuildContext context, Control control, List<ElementoLista> lista) {
  return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
        Icono.crear(control.icono! /* , Theme.of(context).disabledColor  */  ),
        SizedBox(
          width: 16.0,
          height: 30.0,
        ),
        new Expanded(
            child: Container(
                //width: MediaQuery.of(context).size.width -76,
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(0.0),
                decoration: crearDecoracionContenedor(context, control),
                child: Row(
                  children: crearElementosVerificadorHorizontal(
                      context, control, lista),
                )))
      ]));
}

Widget crearVerficadorVertical(
    BuildContext context, Control control, List<ElementoLista> lista) {
  return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
        Icono.crear(control.icono! /* , Theme.of(context).disabledColor  */ ),
/*                           SizedBox(
                              width: 16.0,
                              height: 30.0,
                              //child: const Card(child: Text('')),
                          ), */
        Text(control.textoEtiqueta!),
        Container(
            //width: MediaQuery.of(context).size.width -76,
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(0.0),
            decoration: crearDecoracionContenedor(context, control),
            child: Column(
              children:
                  crearElementosVerificadorVertical(context, control, lista),
            )),
      ]));
}

List<Widget> crearElementosVerificadorVertical(
    BuildContext context, Control control, List<ElementoLista> lista) {
  List<Widget> widgets = [];
  for (ElementoLista elemento in lista) {
    widgets.add(
      new CheckboxListTile(
        value: elemento.seleccionado,
        //value:elemento.valor ==  control.valor,
        title: Text(elemento.titulo!),
        //subtitle: elemento.subitulo??Text(elemento.subitulo),
        activeColor: Theme.of(context).backgroundColor,
        controlAffinity: ListTileControlAffinity.leading,
        //onChanged:  (valorIngresado)  {  control.valor=valorIngresado;    control.accion(control, valorIngresado); },
        onChanged: (valorIngresado) {
          elemento.seleccionado = valorIngresado;
          control.accion! (control, elemento);
        },
        selected: elemento.seleccionado!,
      ),
    );
  }
  return widgets;
}

// Horizontal   Vertical
List<Widget> crearElementosVerificadorHorizontal(
    BuildContext context, Control control, List<ElementoLista> lista) {
  List<Widget> widgets = [];
  for (ElementoLista elemento in lista) {
    widgets.add(
      Checkbox(
        value: elemento.seleccionado,

        //subtitle: Text(elemento.subitulo),
        activeColor: Theme.of(context).backgroundColor,
        onChanged: (valorIngresado) {
          elemento.seleccionado = valorIngresado;
          control.accion!(control, elemento);
        },
      ),
    );
    widgets.add(Text(elemento.titulo!));
  }
  return widgets;
}

Widget crearImagenMarco(
    BuildContext context,
    String ruta,
   [ double height = 80.0,
    double width = 100.0 ]) {
  Widget foto;
  Image imagen;
  File fotoCapturada;

  if (ruta == null || ruta == "") {
    ruta= 'assets/img/no-image.png';
    imagen = Image(
      image: AssetImage(ruta),
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  } else if (ruta.contains('http')) {
    imagen = Image.network(
      ruta,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
    //Future<Uint8List> Image.toByteData();
  } else {
    fotoCapturada = File(ruta);
    imagen = Image.file(
      fotoCapturada,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
  return imagen;
  //   Container(
  //         margin: const EdgeInsets.all(1.0),
  //         padding: const EdgeInsets.all(0.0),
  //         decoration:  crearDecoracionContenedor(context,Control(borde: eTipoBorde.Rectangular )),
  //         child:imagen ,
  // );
}

Widget crearFoto(BuildContext context, Control control) {
  Widget foto;
  Image imagen;
  File fotoCapturada;
  String? ruta = control.valor;
  if (ruta == null || ruta == "") {
    ruta = 'assets/img/no-image.png';
    imagen = Image(
      image: AssetImage(ruta),
      height: 150.0,
      fit: BoxFit.cover,
    );
  } else if (ruta.contains('http')) {
    imagen = Image.network(ruta);
  } else {
    fotoCapturada = File(ruta);
    imagen = Image.file(fotoCapturada);
  }
  return Center(
      child: Column(
    children: <Widget>[
      Text(control.textoEtiqueta!),
      Container(
        margin: const EdgeInsets.all(3.0),
        padding: const EdgeInsets.all(0.0),
        decoration: crearDecoracionContenedor(context, control),
        child: imagen,
      ),
    ],
  ));
}

Widget crearSelectorDeslizante(
  BuildContext context,
  Control control,
) {
  control.colorBorde = Theme.of(context).disabledColor;
  return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
        Icono.crear(control.icono! /* , Theme.of(context).disabledColor  */ ),
        SizedBox(
          width: 16.0,
          height: 30.0,
          //child: const Card(child: Text('')),
        ),
        new Expanded(
            child: Container(
                //width: MediaQuery.of(context).size.width -76,
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(0.0),
                decoration: crearDecoracionContenedor(context, control),
                child: Slider(
                    value: control.valor,
                    min: 1.0,
                    max: 10.0,
                    divisions: 1,
                    activeColor: Theme.of(context).backgroundColor,
                    inactiveColor: Theme.of(context).disabledColor,
                    label: control.textoEtiqueta,
                    onChanged: (valorIngresado) {
                      control.valor = valorIngresado;
                      control.accion!(control, valorIngresado);
                    },
                    semanticFormatterCallback: (double newValue) {
                      return '${newValue.round()} dollars';
                    }))),
      ]));
}

Widget CrearImagenInternet(int imagen) {
  return FadeInImage(
    image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
    placeholder: AssetImage('assets/jar-loading.gif'),
  );
}

Widget CrearImagenUrl(String url) {
  return FadeInImage(
    image: NetworkImage(url),
    placeholder: AssetImage('assets/jar-loading.gif'),
  );
}

Widget crearImagen(String nombbre) {
  //'assets/img/graphics/jar-loading.gif'
  String ruta = 'assets/img/graphics/' + nombbre;
  return Image(image: AssetImage(ruta));
}

