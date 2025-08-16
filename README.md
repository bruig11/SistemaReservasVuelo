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
javaint confirmacion = JOptionPane.showConfirmDialog(null, 
    "¿Está seguro de eliminar esta reserva?", 
    "Confirmar eliminación", 
    JOptionPane.YES_NO_OPTION);
