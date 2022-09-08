//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/baseDatos/baseDatos.dart';
import './../../../nucleo/negocio/modelo/ModeloBase.dart';
export './../../../nucleo/negocio/modelo/ModeloBase.dart';

//  definir entidades de modelo
import '../endidad/Suscripcion.dart';

import '../endidad/MisPendientes.dart';

import '../endidad/Gasto.dart';
import '../endidad/Scaneo.dart';
import '../endidad/Producto.dart';
import '../endidad/Venta.dart';
import '../endidad/VentaProducto.dart';
import '../endidad/Mov.dart';
import '../endidad/Persona.dart';

import '../endidad/Categoria.dart';
import '../endidad/Directorio.dart';
import '../endidad/Ubicacion.dart';
import '../endidad/Persona.dart';
import '../endidad/Perfil.dart';
import '../endidad/Grupo.dart';
import '../endidad/NivelRed.dart';

import '../endidad/FTConsulta.dart';
import '../endidad/FTEstatusTarea.dart';
import '../endidad/FTAvanzarActividad.dart';
import '../endidad/Seguimiento.dart';
import '../endidad/EstadisticasFlujo.dart';
import '../endidad/ActividadInfo.dart';

import '../endidad/FlujoTrabajoDocumento.dart';
import '../endidad/ConsultaDocumentos.dart';

import '../endidad/Productividad.dart';
import '../endidad/ProductividadDetalle.dart';
import '../endidad/ConsultaTramite.dart';

import '../endidad/EstadisticasVista.dart';
import '../endidad/EstadisticasVistaDetalle.dart';


import '../endidad/CuentaUsuario.dart';
import '../endidad/AdministracionUsuarios.dart';

import '../endidad/Cliente.dart';

import '../endidad/ConsultarSocios.dart';

//   exportaciones 

export '../endidad/Suscripcion.dart';

export '../endidad/MisPendientes.dart';

export '../endidad/Gasto.dart';
export '../endidad/Scaneo.dart';
export '../endidad/Producto.dart';
export '../endidad/Venta.dart';
export '../endidad/VentaProducto.dart';

export '../endidad/Mov.dart';
export '../endidad/Persona.dart';

export '../endidad/Categoria.dart';
export '../endidad/Directorio.dart';
export '../endidad/Ubicacion.dart';

export '../endidad/otras.dart';

export '../endidad/Persona.dart';
export '../endidad/Perfil.dart';
export '../endidad/Grupo.dart';
export '../endidad/NivelRed.dart';

export '../endidad/FTConsulta.dart';
export '../endidad/FTEstatusTarea.dart';
export '../endidad/FTAvanzarActividad.dart';
export '../endidad/Seguimiento.dart';
export '../endidad/EstadisticasFlujo.dart';
export '../endidad/ActividadInfo.dart';
export '../endidad/FlujoTrabajoDocumento.dart';
export '../endidad/ConsultaDocumentos.dart';
export '../endidad/Productividad.dart';
export '../endidad/ProductividadDetalle.dart';
export '../endidad/ConsultaTramite.dart';

export '../endidad/EstadisticasVista.dart';
export '../endidad/EstadisticasVistaDetalle.dart';

export '../endidad/CuentaUsuario.dart';
export '../endidad/AdministracionUsuarios.dart';
export '../endidad/Cliente.dart';
export '../endidad/ConsultarSocios.dart';


class ModeloAplicacion extends ModelodBase {
  // declarar entidades
  ConfiguracionAccesoBD configuracionPersitencia;

  ModeloAplicacion(this.configuracionPersitencia) {}
}
