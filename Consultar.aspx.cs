using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace Tienda
{
    public partial class Consultar : System.Web.UI.Page
    {
        string categoria = string.Empty;
        string strConexion = "Server=(Local); Database=Tienda2.0; Integrated Security=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            categoria = Request.QueryString["categoria"];
            if (string.IsNullOrEmpty(categoria))
            {
                cargarDatosCategoria();
                cargarDatosMarca();
                cargarDatos();
            }

            if (!Page.IsPostBack)
            {
                
            }

            
        }

        void cargarDatosCategoria()
        {
            using (var conexion = new SqlConnection(strConexion))
            {
                conexion.Open();
                using (var command = new SqlCommand("Select * from Categoria", conexion))
                {
                    var reader = command.ExecuteReader();
                    if (reader != null && reader.HasRows)
                    {
                        ListItem categoria;
                        while (reader.Read())
                        {
                            categoria = new ListItem();
                            categoria.Value = reader["IdCategoria"].ToString();
                            categoria.Text = reader["Nombre"].ToString();
                            ddlCategoriaConsulta.Items.Add(categoria);
                        }
                    }
                }
            }
        }

        void cargarDatosMarca()
        {
            using (var conexion = new SqlConnection(strConexion))
            {
                conexion.Open();
                using (var command = new SqlCommand("Select * from Producto", conexion))
                {
                    SqlDataReader reader2 = command.ExecuteReader();
                    if (reader2 != null && reader2.HasRows)
                    {
                        ListItem marca;
                        while (reader2.Read())
                        {
                            marca = new ListItem();
                            marca.Text = reader2["Marca"].ToString();
                            ddlMarcaConsulta.Items.Add(marca);
                        }
                    }
                }
            }
        }

        void cargarDatos()
        {
            using (var conexion = new SqlConnection(strConexion))
            {
                string sql = "SELECT IdProducto, A.Nombre, Marca, Precio, B.Nombre AS Categoria, A.Foto AS FOTO, A.Observacion AS Observacion " +
                             "FROM Producto A Inner Join Categoria B ON A.IdCategoria = B.IdCategoria";

                using (var command = new SqlCommand(sql, conexion))
                {
                    var ds = new DataSet();
                    var da = new SqlDataAdapter(command);
                    da.Fill(ds);
                   
                    rptDatos.DataSource = ds;
                    rptDatos.DataBind();
                }
            }
        }

        protected void filtrar(object sender, EventArgs e)
        {
            string categoria = ddlCategoriaConsulta.SelectedValue;


            using (var conexion = new SqlConnection(strConexion))
            {
                conexion.Open();
                string sql = "SELECT IdProducto, A.Nombre, Marca, Precio, B.Nombre AS Categoria, A.Foto AS FOTO, A.Observacion AS Observacion " +
                             "FROM Producto A Inner Join Categoria B ON A.IdCategoria = B.IdCategoria" + 
                             "WHERE B.Nombre=@categoria";

                using (var command = new SqlCommand(sql, conexion))
                {
                    var ds = new DataSet();
                    var da = new SqlDataAdapter(command);
                    da.Fill(ds);

                    rptDatos.DataSource = ds;
                    rptDatos.DataBind();
                }
            }
        }
    }
}