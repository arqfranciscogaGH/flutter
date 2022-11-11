//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto

import '../../nucleo/baseDatos/baseDatos.dart';
import '../negocio/modelo/ModeloAplicacion.dart';

export '../../nucleo/baseDatos/baseDatos.dart';
export '../negocio/modelo/ModeloAplicacion.dart';

class DBAplicacion extends ModelodBase {
  // declarar  variables

  // regresa instancia de  IAccesoBD por defecto
  IAccesoBD get accesoDB {
    if (AccesoBD.isDB)
      return AccesoBD.abd;
    else
      return AccesoBD.instancia;
  }

  abrir() async {
    if (AccesoBD.isDB) {
      if (AccesoBD.abd.configuracion != null &&
          AccesoBD.abd.configuracion.tipoDB == eTipoDB.SQLLITE)
        await AccesoBD.abd.abrir();
    }
  }

  // declarar entidades
  AccesoTabla<ServicioAplicacion>? tablaServicioAplicacion;
  AccesoTabla<Venta>? tablaVenta;
  AccesoTabla<VentaProducto>? tablaVentaProducto;
  AccesoTabla<Cliente>? tablaCliente;
//   AccesoTabla<Suscripcion> tablaSuscripcion;

//  AccesoTabla<CuentaUsuario> tablaCuentaUsuario;
//  AccesoTabla<AdministracionUsuarios> tablaAdministracionUsuarios;

//   AccesoTabla<Persona> tablaPersona;

//   AccesoTabla<Perfil> tablaPerfil;
//   AccesoTabla<Grupo> tablaGrupo;
//   AccesoTabla<NivelRed> tablaNivelRed;

//   AccesoTabla<MisPendientes> tablaMisPendientes;
//   AccesoTabla<FTEstatusTarea> tablaFTEstatusTarea;
//   AccesoTabla<FTAvanzarActividad> tablaFTAvanzarActividad;
//   AccesoTabla<Seguimiento> tablaSeguimiento;
//   AccesoTabla<EstadisticasFlujo> tablaEstadisticasFlujo;
//   AccesoTabla<ActividadInfo> tablaActividadInfo;

//   AccesoTabla<Productividad> tablaProductividad;
//   AccesoTabla<ProductividadDetalle> tablaProductividadDetalle;
//   AccesoTabla<ConsultaTramite> tablaConsultaTramite;

//   AccesoTabla<FlujoTrabajoDocumento> tablaFlujoTrabajoDocumento;
//   AccesoTabla<FlujoTrabajoDocumento> tablaConsultaDocumentos;

//   AccesoTabla<EstadisticasVista> tablaEstadisticasVista;
//   AccesoTabla<EstadisticasVistaDetalle> tablaEstadisticasVistaDetalle;
//   AccesoTabla<ConsultarSocios> tablaConsultarSocios;

/*   AccesoTabla<Categoria> tablaCategoria;
  AccesoTabla<Directorio> tablaDirectorio;

 
  AccesoTabla<Perfil> tablaPerfil;
  AccesoTabla<Persona> tablaPersona;
  AccesoTabla<Producto> tablaProducto;

  AccesoTabla<Mov> tablaMov;
  AccesoTabla<Venta> tablaVenta;
  AccesoTabla<VentaProducto> tablaVentaProducto;
  AccesoTabla<Ubicacion> tablaUbicacion;
  AccesoTabla<Gasto> gastos;
  AccesoTabla<Scaneo> scaneos; */

  DBAplicacion() {
    iniciarTablas();
    // creacionTablas();
  }

  // iniciar entidades
  iniciarTablas() {
    ConfiguracionAccesoBD configuracionPersitenciaMemoria =
        ConfiguracionAccesoBD(
      persitencia: ePersitencia.Memoria,
      tipoDB: eTipoDB.Ninguna,
      nombreBD: '',
      version: 1,
      persitenciaPorDefecto: false,
      contadorRegistros: true,
      dominioApi: '',
      sincronizarServidor: true,
    );

    ConfiguracionAccesoBD _configuracionPersitenciaSqlLite =
        ConfiguracionAccesoBD(
      persitencia: ePersitencia.BaseDatos,
      tipoDB: eTipoDB.SQLLITE,
      nombreBD: 'prueba',
      version: 1,
      persitenciaPorDefecto: true,
      contadorRegistros: false,
      dominioApi: '',
      sincronizarServidor: true,
    );

    ConfiguracionAccesoBD configuracionPersitenciaApiControlConsecutivos =
        ConfiguracionAccesoBD(
      persitencia: ePersitencia.ApiREST,
      tipoDB: eTipoDB.Ninguna,
      nombreBD: '',
      version: 1,
      persitenciaPorDefecto: false,
      contadorRegistros: true,
      // dominioApi: 'arqfranciscoga-002-site3.btempurl.com',
      dominioApi: 'kungio.com',
      sitioApi: '/api/',
      llaveApi: 'prueba',
      sincronizarServidor: true,
    );
    ConfiguracionAccesoBD configuracionPersitenciaApiIdentity =
        ConfiguracionAccesoBD(
      persitencia: ePersitencia.ApiREST,
      tipoDB: eTipoDB.Ninguna,
      nombreBD: '',
      version: 1,
      persitenciaPorDefecto: false,
      contadorRegistros: false,
      // dominioApi: 'arqfranciscoga-002-site3.btempurl.com',
      dominioApi: 'kungio.com',
      sitioApi: '/api/',
      llaveApi: 'prueba',
      sincronizarServidor: true,
    );

    ConfiguracionAccesoBD configuracionApiParametros = ConfiguracionAccesoBD(
      persitencia: ePersitencia.ApiREST,
      tipoDB: eTipoDB.Ninguna,
      nombreBD: '',
      version: 1,
      persitenciaPorDefecto: false,
      contadorRegistros: false,
      // dominioApi: 'arqfranciscoga-002-site3.btempurl.com',
      dominioApi: 'kungio.com',
      sitioApi: '/api/',
      llaveApi: 'prueba',
      sincronizarServidor: true,
    );

    ConfiguracionAccesoBD configuracionPersitenciaFireBase =
        ConfiguracionAccesoBD(
      persitencia: ePersitencia.NoSQLBaseDatos,
      tipoDB: eTipoDB.FireStore,
      nombreBD: 'prueba',
      version: 1,
      persitenciaPorDefecto: false,
      contadorRegistros: true,
      dominioApi: '',
      sincronizarServidor: true,
    );

    tablaServicioAplicacion = agregarTabla<ServicioAplicacion>(
        ServicioAplicacion().iniciar(), configuracionPersitenciaMemoria);
    tablaVenta =
        agregarTabla<Venta>(Venta().iniciar(), configuracionPersitenciaMemoria);
    tablaVentaProducto = agregarTabla<VentaProducto>(
        VentaProducto().iniciar(), configuracionPersitenciaMemoria);
    tablaCliente = agregarTabla<Cliente>(
        Cliente().iniciar(), configuracionPersitenciaApiIdentity);

    //   tablaSuscripcion = agregarTabla<Suscripcion>(
    //       Suscripcion().iniciar(), configuracionApiParametros);

    //  tablaCuentaUsuario =
    //       agregarTabla<CuentaUsuario>(CuentaUsuario().iniciar(), configuracionApiParametros);
    //   tablaAdministracionUsuarios =
    //       agregarTabla<AdministracionUsuarios>(AdministracionUsuarios().iniciar(), configuracionApiParametros);

    //   tablaPersona =
    //       agregarTabla<Persona>(Persona().iniciar(), configuracionApiParametros);

    //   tablaPerfil =
    //       agregarTabla<Perfil>(Perfil().iniciar(), configuracionApiParametros);
    //   tablaGrupo =
    //       agregarTabla<Grupo>(Grupo().iniciar(), configuracionApiParametros);
    //   tablaNivelRed = agregarTabla<NivelRed>(
    //       NivelRed().iniciar(), configuracionApiParametros);

    //   tablaMisPendientes = agregarTabla<MisPendientes>(
    //       MisPendientes().iniciar(), configuracionApiParametros);
    //   tablaFTEstatusTarea = agregarTabla<FTEstatusTarea>(
    //       FTEstatusTarea().iniciar(), configuracionApiParametros);
    //   tablaFTAvanzarActividad = agregarTabla<FTAvanzarActividad>(
    //       FTAvanzarActividad().iniciar(), configuracionApiParametros);
    //   tablaSeguimiento = agregarTabla<Seguimiento>(
    //       Seguimiento().iniciar(), configuracionApiParametros);
    //   tablaEstadisticasFlujo = agregarTabla<EstadisticasFlujo>(
    //       EstadisticasFlujo().iniciar(), configuracionApiParametros);
    //   tablaActividadInfo = agregarTabla<ActividadInfo>(
    //       ActividadInfo().iniciar(), configuracionApiParametros);

    //   tablaConsultaDocumentos = agregarTabla<FlujoTrabajoDocumento>(
    //       FlujoTrabajoDocumento().iniciar(), configuracionApiParametros);
    //   tablaFlujoTrabajoDocumento = agregarTabla<FlujoTrabajoDocumento>(
    //       FlujoTrabajoDocumento().iniciar(), configuracionApiParametros);

    //   tablaProductividad = agregarTabla<Productividad>(
    //       Productividad().iniciar(), configuracionApiParametros);

    //   tablaProductividadDetalle = agregarTabla<ProductividadDetalle>(
    //       ProductividadDetalle().iniciar(), configuracionApiParametros);

    //  tablaConsultaTramite =agregarTabla<ConsultaTramite>(ConsultaTramite().iniciar(), configuracionApiParametros);

    //  tablaEstadisticasVista =agregarTabla<EstadisticasVista>(EstadisticasVista().iniciar(), configuracionApiParametros);

    //  tablaEstadisticasVistaDetalle =agregarTabla<EstadisticasVistaDetalle>(EstadisticasVistaDetalle().iniciar(), configuracionApiParametros);

    //  tablaConsultarSocios =agregarTabla<ConsultarSocios>(ConsultarSocios().iniciar(), configuracionApiParametros);

/* 




    tablaUsuario = agregarTabla<Usuario>(
        Usuario().iniciar(), configuracionPersitenciaApiIdentity);
    tablaCategoria = agregarTabla<Categoria>(
        Categoria().iniciar(), configuracionPersitenciaApiIdentity);
    tablaDirectorio = agregarTabla<Directorio>(
        Directorio().iniciar(), configuracionPersitenciaApiIdentity);

    tablaPersona =
        agregarTabla<Persona>(Persona().iniciar(), configuracionPersitencia);
    gastos = agregarTabla<Gasto>(Gasto().iniciar(), configuracionPersitencia);
    //gastos = configuracionPersitencia.agregarTabla<Gasto>(Gasto().iniciar());
    tablaProducto =
        agregarTabla<Producto>(Producto().iniciar(), configuracionPersitencia);
    scaneos =
        agregarTabla<Scaneo>(Scaneo().iniciar(), configuracionPersitencia);
    tablaMov = agregarTabla<Mov>(Mov().iniciar(), configuracionPersitencia);
    tablaVenta =
        agregarTabla<Venta>(Venta().iniciar(), configuracionPersitencia);
    tablaVentaProducto = agregarTabla<VentaProducto>(
        VentaProducto().iniciar(), configuracionPersitencia);
    tablaUbicacion = agregarTabla<Ubicacion>(
        Ubicacion().iniciar(), configuracionPersitenciaMemoria);
    */

    /*     ConfiguracionAccesoBD(
        persitencia: ePersitencia.Memoria , 
        //persitencia: ePersitencia.Memoria ,         
        // persitencia: ePersitencia.BaseDatos , tipoDB:eTipoDB.SQLLITE, 
        //nombreBD:'prueba', version:1,
       urlApi: 'http://www.apimenet.somee.com/api', controladorApi: "personas" , sincronizarServidor: true,) */
  }

  void creacionTablas() async {
    await AdministradorAcceso.abrir();
  }

  AccesoTabla<T> agregarTabla<T extends EntidadBase>(
      T entidad, ConfiguracionAccesoBD configuracion) {
    if (configuracion.tablas == null) configuracion.tablas = [];
    configuracion.tablas!.add(entidad);
    return new AccesoTabla<T>(
        claseEntidad: entidad, configuracion: configuracion);
  }
}
