using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Tienda
{
    public partial class Productos : System.Web.UI.Page
    {
        string strConexion = "Server=(local); Database=Tienda2.0; Integrated Security = true";

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarDatos();
        }

        void cargarDatos()
        {
            using (var conexion = new SqlConnection(strConexion))
            {
                string sql = "SELECT IdProducto, A.Nombre, Marca, Precio, B.Nombre AS Categoria, A.Foto AS FOTO " +
                             "FROM Producto A Inner Join Categoria B ON A.IdCategoria = B.IdCategoria";

                using (var command = new SqlCommand(sql, conexion))
                {
                    var ds = new DataSet();
                    var da = new SqlDataAdapter(command);
                    da.Fill(ds);
                    grvDatos.DataSource = ds;
                    grvDatos.DataBind();

                    rptDatos.DataSource = ds;
                    rptDatos.DataBind();
                }
            }
        }
    }
}