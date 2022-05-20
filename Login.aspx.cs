using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tienda
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void iniciar_sesion(object sender, EventArgs e)
        {
            string user = txtUsuario.Value;
            string password = txtPassword.Value;

            //if(string.IsNullOrEmpty(user) || string.IsNullOrEmpty(password))
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "alert('Debe escribir todos los campos')", true);
            //}

            var strConexion = "Server=WINDOWS-JARLEY; Database=Tienda2.0; Integrated Security = true";

            using (var conexion = new SqlConnection(strConexion))
            {
                conexion.Open();
            }
            
            if (user == "admin" && password == "1234")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "alert('Usuario Logueado')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "alert('Las credenciales no son correctas')", true);
            }
            

        }
    }
}