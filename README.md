Conexion.java
     public Conexion() {
    }
      public static Connection getConexion() throws SQLException
    {
                                //parametros para establecer la conexion 
        String cadenaConexion = "jdbc:sqlserver://localhost:1433;" + //controlador jdbc, servidor y sus puertos
                                "database=GestionVuelos;"+//Base de datos a usar 
                                "user=SB;"+//usuario de conexion a sql 
                                "password=admin;"+//clave de conexion a sql     
                                "encryption=false;"+//conexion encriptada
                                "trustServerCertificate=true;";//certificado de confianza 
        try {
            //Establecer una conexion con los parametros datos
            Connection con = DriverManager.getConnection(cadenaConexion);
            return con;
        }
        catch (SQLException ex){
            JOptionPane.showMessageDialog(null, ex.toString());
            return null;
        }
    }

Propósito: Clase utilitaria para establecer conexiones JDBC con SQL Server.
Componentes:
Constructor vacío:
Permite instanciar la clase sin parámetros específicos.
Método estático getConexion():

String de conexión: Define parámetros JDBC para SQL Server local

Servidor: localhost:1433
Base de datos: GestionVuelos
Credenciales: usuario "SB", password "admin"
Configuración de seguridad: sin encriptación, certificado confiable


Conexión: Utiliza DriverManager.getConnection() para establecer la conexión
Manejo de excepciones: Captura SQLException, muestra mensaje de error vía JOptionPane y retorna null
Retorno: Objeto Connection si es exitoso, null si falla


//Formularios para visualzacion 

FrmConsultarItinerarios.java

Propósito: Interfaz de solo lectura para consultar itinerarios de vuelos.
Segmento clave - Acción del botón:
javaprivate void btnConsultarItinerarioActionPerformed(java.awt.event.ActionEvent evt) {
    try {
        ResultSet Resultado = itinerarioConsult.listarItinerario();
        if (Resultado != null) {
            jTable1.setModel(DbUtils.resultSetToTableModel(Resultado));
        }
    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Error: " + ex.getMessage());
    }
}

Invoca método estático para obtener datos, utiliza DbUtils para mapear ResultSet a modelo de tabla. Patrón simple de consulta sin validaciones complejas.

FrmCrearCliente.java

Propósito: CRUD completo para gestión de clientes.
Segmento clave - Operación guardar/actualizar:
javaprivate void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {
    Clientes miCliente = new Clientes();
    // Mapeo de campos a objeto
    miCliente.setIdCliente(Integer.parseInt(txtID.getText()));
    miCliente.setNombre(txtNombre.getText());
    
  int indice = 0;
    try{
        Clientes consulta = CRUDClientes.obtenerCliente(txtID.getText());
        if(consulta !=null){
            indice=consulta.getIdCliente();
        }
    }catch (SQLException ex){
        indice=0;
    }
     
  if (indice == 0){
        // INSERT
        CRUDClientes.insertCliente(miCliente);
    }else{
        // UPDATE  
        CRUDClientes.updateCliente(miCliente);
    }
}
Implementa patrón de validación previa para determinar operación (INSERT vs UPDATE). Utiliza consulta de existencia como discriminador.
Método utilitario de actualización:
javaprivate void actualizar(){
    ResultSet resultado = CRUDClientes.listarCliente();
    tblCliente.setModel(DbUtils.resultSetToTableModel(resultado));
}

FrmCrearReserva.java
Propósito: CRUD para reservas con validaciones de integridad referencial.
Segmento clave - Validación de fecha:
javaif (dtpFechaReserva.getDate() != null) {
    miReserva.setFechaReserva(new java.sql.Date(dtpFechaReserva.getDate().getTime()));
} else {
    JOptionPane.showMessageDialog(null, "Por favor selecciona una fecha");
    return;
}
Validación automática con FocusLost:
javaprivate void txtCodClienteFocusLost(java.awt.event.FocusEvent evt) {
    try{
        int Id = Integer.parseInt(txtCodCliente.getText());
        txtNombreCliente.setText(CRUBReserva.nomCliente(Id));
    }catch (SQLException ex){
        JOptionPane.showMessageDialog(null, ex.toString());
    }
}


Implementa validación en tiempo real usando eventos FocusLost para verificar integridad referencial y autocompletar campos relacionados.
Confirmación de eliminación:

Sistema CRUD para Gestión de Viajes
Este repositorio contiene la implementación de operaciones CRUD (Create, Read, Update, Delete) para un sistema de gestión de viajes, incluyendo la administración de Clientes, Itinerarios y Reservas.

Funcionalidades
El sistema permite realizar operaciones completas de gestión de datos para:

Clientes: Gestión de información personal de los usuarios
Itinerarios: Administración de rutas y planes de viaje
Reservas: Control de reservaciones y asignaciones

Arquitectura del Sistema
Estructura de Clases CRUD
Cada módulo (Clientes, Itinerarios, Reservas) sigue la misma estructura y patrones de diseño, implementando las siguientes operaciones:
Operaciones Principales

Generación de ID Consecutivo
Obtención de Registros Individuales
Listado de Registros
Inserción de Nuevos Registros
Actualización de Registros Existentes
Eliminación de Registros

Dinámicas CRUD
Ejemplo: Módulo de Clientes
A continuación se muestra la implementación del CRUD de Clientes como referencia. La misma dinámica y estructura se aplica para los módulos de Itinerarios y Reservas, adaptando únicamente los nombres de las tablas, campos y objetos correspondientes.
1. Generación de ID Consecutivo
javapublic static int IdConsecutivo() throws SQLException

Obtiene el siguiente ID disponible consultando el valor máximo actual
Garantiza la unicidad de identificadores
Retorna el próximo número consecutivo para asignar

2. Obtención de Registro Individual
javapublic static Clientes obtenerCliente(String id) throws SQLException

Busca y retorna un cliente específico por su ID
Crea y llena un objeto Cliente con los datos de la base de datos
Maneja excepciones de conexión y consulta

3. Listado de Registros
javapublic static ResultSet listarCliente() throws SQLException

Obtiene todos los registros de la tabla
Retorna un ResultSet para su procesamiento
Selecciona los campos principales para visualización

4. Inserción de Nuevos Registros
javapublic static int insertCliente(Clientes miCliente) throws SQLException

Recibe un objeto Cliente completo
Construye la consulta SQL INSERT
Retorna el número de filas afectadas

5. Actualización de Registros
javapublic static int updateCliente(Clientes miCliente) throws SQLException

Modifica un registro existente basado en el ID
Actualiza todos los campos modificables
Retorna el número de filas afectadas

6. Eliminación de Registros
javapublic static int deleteUsuario(int id) throws SQLException

Elimina un registro específico por ID
Ejecuta DELETE con condición WHERE
Retorna el número de filas afectadas

Implementación Técnica
Conexión a Base de Datos

Utiliza la clase Conexion para establecer conexión con SQL Server
Manejo de excepciones SQLServerException
Uso de Statement para ejecución de consultas

Patrones de Diseño

DAO (Data Access Object): Separación de la lógica de acceso a datos
Static Methods: Métodos estáticos para acceso directo sin instanciación
Exception Handling: Manejo consistente de errores de base de datos

Consideraciones de Seguridad

Nota: El código actual utiliza concatenación de strings para construir consultas SQL. Se recomienda implementar PreparedStatements para prevenir inyecciones SQL.

 Módulos del Sistema
1. CRUD Clientes

Gestión de información personal
Campos: ID, Nombre, Apellidos, Identificación

2. CRUD Itinerarios

Misma dinámica que Clientes
Gestión de rutas y planes de viaje
Operaciones idénticas adaptadas a la entidad Itinerario

3. CRUD Reservas

Misma dinámica que Clientes
Control de reservaciones
Operaciones idénticas adaptadas a la entidad Reserva

 Uso del Sistema
Cada clase CRUD puede utilizarse de forma independiente:
java// Ejemplo de uso para Clientes
int nuevoId = CRUDClientes.IdConsecutivo();
Clientes cliente = CRUDClientes.obtenerCliente("123");
ResultSet lista = CRUDClientes.listarCliente();
int resultado = CRUDClientes.insertCliente(nuevoCliente);

 Flujo de Operaciones

Create: Generar ID → Crear objeto → Insertar en BD
Read: Consultar por ID o listar todos los registros
Update: Obtener registro → Modificar objeto → Actualizar en BD
Delete: Identificar registro → Ejecutar eliminación
javaint confirmacion = JOptionPane.showConfirmDialog(null, 
    "¿Está seguro de eliminar esta reserva?", 
    "Confirmar eliminación", 
    JOptionPane.YES_NO_OPTION);
