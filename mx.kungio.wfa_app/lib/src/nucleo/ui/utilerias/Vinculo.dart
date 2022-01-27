//  librerias internas de flutter

//  librerias importadas flutter
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Vinculo {
  static llamar(String valor) {
    print(valor);
    String url = "tel://$valor";
    launch(url);
  }

  static enviarCorreo(String correo, String asunto, String mensaje) {
    String url = "mailto:" + correo + "?subject=${asunto}&body=${mensaje}";
    print(url);
    launch(url);
  }

  static enviarMensaje(String valor) {
    String url = "sms:$valor";
    print(valor);
    launch(url);
  }

  static enviarWhastApp(String valor) {
    String url = "whatsapp://send?phone=+52$valor";
    print(url);
    launch(url);
  }

  static visitarSitio(String valor) {
    String url = valor;
    print(url);
    launch(url);
  }

  static visitarFacebook(String valor) {
    print(valor);
    //String url="fb.me/arqfranciscoga";
    String url = "fb.me/" + valor;
    print(url);
    launch("http://$url");
  }

  static abrirMapaPorDireccion(String valor) {
    //String url="fb.me/arqfranciscoga";
    String url = valor;
    print(url);
    MapsLauncher.launchQuery(url);
  }

  static abrirMapaPorCoordenadas(
      double latitud, double longitud, String mensaje) {
    MapsLauncher.launchCoordinates(latitud, longitud, mensaje);
  }

  static abrirMapaEnWeb(double latitud, double longitud) {
    String appleUrl = "https://maps.apple.com/?sll=${latitud},${longitud}";
    String googleUrl = "comgooglemaps://?center=${latitud},${longitud}";
    String url = googleUrl;
    print(url);
    launch(url);
  }
}
