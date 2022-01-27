
//  librerias internas de flutter

import 'package:flutter/material.dart';


//  librerias importadas flutter


//  librerias  proyecto

class Tabs {


   static TabBar crearTitulos(TabController contraladorTab,var titulos)
    {
      return TabBar(
          tabs:titulos,
          controller:contraladorTab ,
      );

    }
    static TabBarView crearVistas(TabController contraladorTab, var vistas)
    {
      return TabBarView( children :vistas ,  controller:contraladorTab , );
    }
}