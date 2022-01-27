import 'package:flutter/material.dart';
import '../comun/colores.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_svg/flutter_svg.dart';

final _listaSvg = <String, String>{
    'usa'           : 'assets/svg/usa.svg'  ,
    'mexico'        : 'assets/svg/mexico.svg'      
};
final _listaIcons = <String, IconData>{
      'house'                      : Icons.house  ,  
      'login'                      : Icons.login  ,   
      'exit_to_app'                : Icons.exit_to_app,      
      'menu'                      : Icons.menu   ,   
      'tema'                      : Icons.color_lens ,     
      'brocha'                     : Icons.brush   , 
      'settings'                  : Icons.settings  ,  

      'recomendacion'             :Icons.recommend ,
      'siguiente'                 :Icons.next_plan_sharp,
      'trabajo'                  : Icons.work_outlined  ,  
      'trabajo_grupo'            : Icons.group_work_sharp  ,         
      'actor'                     :Icons.recent_actors ,
      'persona'                   : Icons.person,  
      'cuentaDinero'              : Icons.account_balance_wallet,     
      'cuenta'                   : Icons.person_pin_sharp,    
      'usuario'                   : Icons.account_circle,   
      'usuarios'                  : Icons.supervised_user_circle,  
      'personaLibre'              : Icons.accessibility, 

 
      'group_work'                : Icons.group_work      , 
      'perfil'                    : Icons.supervised_user_circle,  

      'nivel'                    : Icons.account_tree_rounded,   
      'seguridad'                  : Icons.security,  

      'tocar'                     : Icons.play_circle_fill , 
      'historia'                 : Icons.history_toggle_off_outlined ,   


      'tarjeta'                   : Icons.card_giftcard  ,
      'analytics'                  : Icons.analytics,  

      'videocam'                   : Icons.videocam,  
      'photo_size_select_actual'   : Icons.photo_size_select_actual,  
      'camera_alt'                 : Icons.camera_alt,  

      'circulo'                   : Icons.circle, 
      'numeros'                   : Icons.format_list_numbered_rtl,   
      'dashboard'                 : Icons.dashboard_customize,   


  
      'stop'                      : Icons.adjust_outlined,   
      'preferencias'              : Icons.app_settings_alt_sharp , 
      'descargar'                 : Icons.archive_rounded  ,    
      'articulo'                  : Icons.article_sharp   ,  

      'seleccionar'                    : Icons.verified_user,
      'check'                          : Icons.check    ,        
      'beenhere'                       : Icons.beenhere   ,
      'palomita'                       : Icons.assignment_turned_in,  
      'fact_check '                    : Icons.fact_check     ,

      'libro'                          : Icons.auto_stories ,  
 

      'batch_prediction'                   : Icons.batch_prediction  ,
      'block_flipped '                   : Icons.block_flipped   ,

      'book'                           : Icons.book    ,
      'bookmark'                       : Icons.bookmark    ,  
      'brightness_low_rounded'         : Icons.brightness_low_rounded   , 


      'multiline_chart_outlined '       : Icons.multiline_chart_outlined      , 
      
      'build'                            : Icons.build     ,
      'business_center_rounded'         : Icons.business_center_rounded     ,
      'call'                   : Icons.call     ,
      'cancel'                   : Icons.cancel     ,

      'cases'                   : Icons.cases     ,
      'category'                   : Icons.category     ,
      'chat_bubble'                   : Icons.chat_bubble    ,

      'contact_mail'                   : Icons.contact_mail     ,
      'construction_sharp'                   : Icons.construction_sharp     ,
      'contact_support'                   : Icons.contact_support     ,
    

      'sensor_door'                   : Icons.sensor_door     ,
      'format_list_numbered'                   : Icons.format_list_numbered      ,

      'filter_alt '                         : Icons.filter_alt     ,
      'grade'                              : Icons.grade     ,
      'grade_outlined'                   : Icons.grade_outlined      ,
      
      'insert_emoticon'                   : Icons.insert_emoticon       ,  
      'insert_drive_file'                   : Icons.insert_drive_file        ,  
      'insert_drive_file_outlined'                   : Icons.insert_drive_file_outlined         ,  
      'inventory'                         : Icons.inventory         ,  
      'keyboard_control_sharp'                   : Icons.keyboard_control_sharp         ,  
      'keyboard_hide'                   : Icons.keyboard_hide         ,  
      'language'                         : Icons.language          , 
      'layers'                          : Icons.layers          ,   
      'launch_sharp'                   : Icons.launch_sharp           , 
      'linear_scale_outlined'                   : Icons.linear_scale_outlined            , 
      'list_alt'                         : Icons.list_alt      , 
  
      'dinero2'                    : Icons.local_atm     , 
      'monetization_on'                    : Icons.monetization_on      , 
      'monetization_on_outlined'                    : Icons.monetization_on_outlined      ,    
      // 'pin_outlined  '                    : Icons.pin       ,   
      //  'pin_rounded '                    : Icons.pin_rounded      ,              

      'local_library'                   : Icons.local_library     , 
      'list_rounded'                   : Icons.list_rounded    , 
      'location_on'                   : Icons.location_on    , 
      'location_on_outlined'                   : Icons.location_on_outlined    , 
      'lock'                   : Icons.lock    , 
      'lock_open'                   : Icons.lock_open     , 
      'map'                   : Icons.map     , 
      'mediation'                   : Icons.mediation     , 
      'menu_book'                   : Icons.menu_book     , 
      'miscellaneous_services '                   : Icons.miscellaneous_services      , 

      'documentos'             : Entypo.documents,   
                      
      'dispositivos'           : Icons.devices,  
      'negocios'               : Icons.business,  

      'mensaje'                : Icons.message  ,    

      'map_pin'                : FontAwesome.map_pin  ,              
      'industry'               : FontAwesome.industry    ,   
      'direccion'              : Entypo.address ,         
      'storefront'             : Icons.storefront   ,  
      'store_mall_directory'   : Icons.store_mall_directory  ,  

      'whatsApp'               : FontAwesome.whatsapp  ,              
      'facebook'               : FontAwesome.facebook     ,   
      'video'                  : Entypo.video ,  
      'youtube'                : FontAwesome.youtube ,              
      'sitio'                  : FontAwesome.internet_explorer ,          

      'arrow_back'             : Icons.arrow_back,  
      'add_alert'              : Icons.add_alert,
      'contrasena'             : Icons.lock_outline,            
      'add_circle'             : Icons.add_circle,
    


      'banco'                  : Icons.account_balance,    
      'listanumero'            : Icons.format_list_numbered,  
      'numero'                 : Icons.confirmation_number ,  
      'telefono'               : Icons.call_end,    
      'comentario'             : Icons.comment,  
      'timer'                 : Icons.timer  ,
      'card_membership'       : Icons.card_membership  ,      
      'tienda'                : Icons.store,  
                         

      'folder_open'           : Icons.folder_open,
      'donut_large'           : Icons.donut_large,
      'money'                 : Icons.attach_money,    
      'input'                 : Icons.input,
      'list'                  : Icons.list,
      'tune'                  : Icons.tune,
      'flip'                  : Icons.flip, 
      'star'                  : Icons.star,       
      'arrow_right'           : Icons.arrow_right,
      'account_circle'        : Icons.account_circle,
      'accessibility'         : Icons.accessibility ,
      'email'                 : Icons.email ,  

      'estaus'                : Icons.notifications ,  
  
      'nota'                  : Icons.notes ,             
      'emailArroba'           : Icons.alternate_email ,          
      'alternate_email'       : Icons.alternate_email    , 
      'lock'                  : Icons.lock     ,
      'lock_open'             : Icons.lock_open    ,
      'calendar_today'        : Icons.calendar_today   , 
      'scanner'               : Icons.scanner   , 
      'codigo'               : Icons.code   ,       
      'account_box'           : Icons.account_box   ,   
      'add_photo_alternate'   : Icons.add_photo_alternate   ,   
      'foto'                  : Icons.photo   ,   
      'compartir'             : Icons.share   ,  
      'camara'                : Icons.camera_alt   ,  
  
      'search'                :Icons.search ,
      'filter_center_focus'   :Icons.filter_center_focus ,
      
 
      'save'                  : Icons.save,    
      'edit'                  : Icons.edit , 
      'pages'                 : Icons.pages ,  
      'streetview'            : Icons.streetview , 
      'find_in_page'          : Icons.find_in_page ,                        
      'attach_money'          : Icons.attach_money ,                        
      'perm_contact_calendar' : Icons.perm_contact_calendar ,  
      'brillo'                : Icons.brightness_low ,
      'actualizar'            : Icons.refresh ,
      'info'                  : Icons.info   ,  
      'question_answer'       : Icons.question_answer  ,  
      'graficaPie'            : Icons.pie_chart_outline_outlined    ,              
      'red'                   : Icons.network_check_rounded, 
      
      'error'                 : Icons.error  ,  
      'cerrar'                : Icons.close   , 
      'cancelar'              : Icons.cancel_presentation,
      'backspace'             : Icons.backspace ,
      'time'                  : Icons.access_time ,  
      'bar_chart'             : Icons.bar_chart  ,      
      'bubble_chart '         : Icons.bubble_chart    ,
      'donut_large'           : Icons.donut_large    ,
      'dona'                  :  Icons.donut_large,
      'barra'                 : Icons.bar_chart,
      'pieNormal'             : Icons.pie_chart,   
      'activity'              : Icons.local_activity,     
      'tarea'                 : Icons.local_activity,   
      'card_membership '      : Icons.card_membership   ,  
      'socio'               : Icons.card_membership   ,    
      'redGrupo'              : Icons.group_sharp ,  
      'grupo'                 : Icons.group,      
  
 };



class Iconos
{
  String nombre ;
  Color color ;
  double tamano;
  Iconos(this.nombre, this.color  , this.tamano )   { }
  Icon obtener()  {
      return crear( this.nombre, this.color  , this.tamano  );
  }

  
  // static SvgPicture crearSvg( String nombre , [ Color color ,  double tamano ]  ) {
  //     String svg =_listaSvg[nombre];
  //     return SvgPicture.asset(svg , color:color );
  // }
  static Icon crear( String nombre , [ Color color ,  double tamano ]  ) {
      IconData icono;
      if (nombre==null || nombre=="" )
          return null ;    
      icono=_listaIcons[nombre];
      if (icono==null || icono=="" )
          return null ;          
          //icono=Icons.bookmark;
      if ( ( color!=null && color!=0  ) &&  ( tamano==null || tamano==0  ) )
          return Icon( icono, color: color );
      else if ( ( color!=null && color!=0  ) &&  ( tamano!=null || tamano!=0  ) )
           return Icon( icono, color: color , size:tamano );  
      else
          return Icon( icono);           
  }

}
class RepetidorIcono extends StatelessWidget {
    BuildContext context;
    String icono;
    Color color ;
    double tamano;      
    int numero;    
    bool enFila;
    RepetidorIcono ( { this.context , this.icono ,this.color,this.tamano, this.numero=3,this.enFila=true} );
    @override
    Widget build (BuildContext context)
    {
        List<Widget> iconos = List<Widget> ();
         for(var i  = 0; i < numero; i++){
             iconos.add( Iconos.crear(icono, color, tamano));
         }
        if (enFila)
          return  Row(children: iconos  );
        else
          return  Column(children: iconos  );       
    }
}



