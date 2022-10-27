import 'package:flutter/material.dart';

class Mensaje{
      void mostrar(BuildContext context, String mensaje) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(mensaje),
          ),
        );
      }
}