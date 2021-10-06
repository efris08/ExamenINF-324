using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace Ejercicio4
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly MySqlConnection cnx = null;
        MySqlCommand cmd = null;
        MySqlDataAdapter da = null;
        DataTable dt = null;
        private string dato = null;
        Conexion C = null;
        public Login()
        {
            C = new Conexion();
            cnx = C.Cnx();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id_rol"] != null)
            {
                if (Session["id_rol"].Equals("1"))
                {
                    Response.Redirect("notas_est.aspx");
                }
                else if (Session["id_rol"].Equals("2"))
                {
                    Response.Redirect("notas_doc.aspx");
                }
            }

        }
        public void Validar(string n, string p)
        {//Obtiene los datos del usuario
            try
            {
                cmd = new MySqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "SELECT*FROM usuarios where usuario=@usuario and password=@password";
                //  MessageBox.Show(cmd.CommandText);
                cmd.Parameters.Add(new MySqlParameter("@usuario", n));
                cmd.Parameters.Add(new MySqlParameter("@password", p));
                cnx.Open();
                MySqlDataReader lector = cmd.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                        //Agregamos una sesion de usuario
                        Session["id_rol"] = lector.GetString(4);
                    Session["usuario"] = lector.GetString(2);

                    if (Session["id_rol"].Equals("1"))

                        Response.Redirect("notas_est.aspx");
                    else
                        Response.Redirect("notas_doc.aspx");
                }
                else

                    lblError.Text = "Error de Usuario o Contrasenia";
            }
            catch (Exception e)
            { }
            finally
            { cnx.Close(); }

        }

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            Validar(txtUsu.Text, txtPass.Text);
        }

    }
}