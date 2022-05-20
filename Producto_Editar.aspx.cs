using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace Tienda
{
    public partial class Producto_Editar : System.Web.UI.Page
    {
        string idProducto = string.Empty;
        string strConexion = "Server=(Local); Database=Tienda2.0; Integrated Security=true";
        protected void Page_Load(object sender, EventArgs e)
        {
            idProducto = Request.QueryString["id"];
            if (string.IsNullOrEmpty(idProducto))
            {
                Response.Redirect("productos.aspx");
            }

            if (!Page.IsPostBack)
            {
                cargarDatosProducto();
            }
           
        }

        void cargarDatosProducto()
        {
            using(var conexion = new SqlConnection(strConexion))
            {
                conexion.Open();
                var sql = "SELECT * FROM PRODUCTO WHERE IdProducto=@id";
                using (var command = new SqlCommand(sql, conexion))
                {
                    command.Parameters.AddWithValue("@id", idProducto);
                    var reader = command.ExecuteReader();
                    if (reader != null && reader.HasRows)
                    {
                        reader.Read();
                        txtNombre.Text = reader["Nombre"].ToString();
                        txtMarca.Text = reader["Marca"].ToString();
                        txtPrecio.Text = reader["Precio"].ToString();
                        txtObservacion.Text = reader["Observacion"].ToString();
                    }
                }
            }
        }

        protected void actualizar(object sender, EventArgs e)
        {
            var nombre = txtNombre.Text;
            var marca = txtMarca.Text;
            var precio = Double.Parse(txtPrecio.Text);
            var observacion = txtObservacion.Text;
            int id = int.Parse(idProducto);


            using(var conexion = new SqlConnection(strConexion))
            {
                conexion.Open();
                var sql = "UPDATE PRODUCTO SET Nombre=@nombre, Marca=@marca, Precio=@precio, Observacion=@observacion WHERE IdProducto=@id";
                using(var command = new SqlCommand(sql, conexion))
                {
                    command.Parameters.AddWithValue("@nombre", nombre);
                    command.Parameters.AddWithValue("@marca", marca);
                    command.Parameters.AddWithValue("@precio", precio);
                    command.Parameters.AddWithValue("@observacion", observacion);
                    command.Parameters.AddWithValue("@id", id);
                    int filas = command.ExecuteNonQuery();

                    if(filas > 0)
                    {
                        var script = "alert('Producto Actualizado'); ";
                            script += "window.location='productos.apsx';";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", script, true);
                        //Response.Redirect("productos.aspx");
                    }
                }
            }
        }
    }
}