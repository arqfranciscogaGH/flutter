import 'package:location/location.dart';
// import 'package:latlong/latlong.dart';

class Localizacion {
  static obtener(
      Function actualizarLocalizacion, Function regresarLocalizacion) async {
    Location location = new Location();
    String ubicacion = "";
/*       // bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      } */

/*       _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      } */

    LocationData currentLocation = await location.getLocation();
    print(currentLocation.latitude);
    print(currentLocation.longitude);
    ubicacion = currentLocation.latitude.toString() +
        "," +
        currentLocation.longitude.toString();

    // location.onLocationChanged.listen((LocationData dataLocation) {
    //       print (dataLocation.latitude) ;
    //       print (dataLocation.longitude) ;
    //       ubicacion=dataLocation.latitude.toString()+ ","+dataLocation.longitude.toString() ;
    //       //metodoRecibirResultado(ubicacion);
    // });
    if (ubicacion == null || ubicacion == '')
      ubicacion = "19.6591206,-99.2126623";
    actualizarLocalizacion(regresarLocalizacion, ubicacion);
    // if (currentLocation!=null)
    // {
    //       actualizarLocalizacion(regresarLocalizacion,currentLocation.latitude.toString()+ ","+currentLocation.longitude.toString() );
    // }
  }
  // static LatLng getLatLng( String valor) {
  //     if (valor==null || valor=="")
  //       valor="19.6591206,-99.2126623";
  //     dynamic  lalo;
  //     if ( valor.contains('geo') )
  //         lalo = valor.substring(4).split(',');
  //     else
  //         lalo = valor.substring(0).split(',');
  //     double lat  = double.parse( lalo[0] );
  //     double lng  = double.parse( lalo[1] );

  //   return LatLng( lat, lng );
  // }
}
