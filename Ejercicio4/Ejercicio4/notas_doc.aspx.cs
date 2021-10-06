using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ejercicio4
{
    public partial class notas_doc : System.Web.UI.Page
    {
        private readonly MySqlConnection cnx = null;
        MySqlCommand cmd = null;
        MySqlDataAdapter da = null;
        DataTable dt = null;
        Conexion C = null;
        public notas_doc()
        {
            C = new Conexion();
            cnx = C.Cnx();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id_rol"] != null)
            {
                if (!Session["id_rol"].Equals("2"))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    gvNotas.DataSource = RetornaTabla();
                    gvNotas.DataBind();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
        public DataTable RetornaTabla()
        {
            dt = null;
            try
            {
                dt = new DataTable();
                //Instanciamos el objeto comando con el TSQL
                cmd = new MySqlCommand();//(nombre_sp, cnx);
                cmd.Connection = cnx;
                //Asignamos el tipo de comando a ejecutar.
                cmd.CommandType = CommandType.StoredProcedure;
                //Agregamos el nombre del Srore procedure.
                cmd.CommandText = "sp_notas_doc";
                //Instanciamos el objeto Adaptador con el comando a utilizar
                da = new MySqlDataAdapter(cmd);
                //Llenamos el Dataset con el adaptador de datos.
                da.Fill(dt);
            }
            catch (Exception e)
            {
                //MessageBox.Show(e.ToString());
            }
            finally
            {
                cnx.Dispose();
                cmd.Dispose();
                //  da.Dispose();
            }
            return dt;
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("id_rol");
            Session.Remove("usuario");
            Response.Redirect("Login.aspx");
        }
    }
}