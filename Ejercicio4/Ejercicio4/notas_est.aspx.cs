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
    public partial class notas_est : System.Web.UI.Page
    {
        private readonly MySqlConnection cnx = null;
        MySqlCommand cmd = null;
        MySqlDataAdapter da = null;
        DataTable dt = null;
        Conexion C = null;
        private string dato = null;
        public notas_est()
        {
            C = new Conexion();
            cnx = C.Cnx();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id_rol"] != null)
            {
                if (!Session["id_rol"].Equals("1"))
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Label1.Text += Get_Name();
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
                cmd.CommandText = "sp_notas_est";
                //Agregamos los parametros a ejecutar
               cmd.Parameters.AddWithValue("_usuario", Session["usuario"].ToString());
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
        public string Get_Name()
        {//Obtiene un campo
            string user = Session["usuario"].ToString();
            try
            {
                cmd = new MySqlCommand();
                cmd.Connection = cnx;
                cmd.CommandText = "SELECT P.nombre FROM persona P inner join usuarios U ON U.ci=P.ci WHERE U.usuario=@user";
                //  MessageBox.Show(cmd.CommandText);
                cmd.Parameters.Add(new MySqlParameter("@user", user));
                cnx.Open();
                MySqlDataReader lector = cmd.ExecuteReader();
                if (lector.HasRows)
                {
                    while (lector.Read())
                        dato = lector.GetString(0);
                    lector.Close();
                }
                else
                    dato = null;
            }
            catch (Exception e)
            {  }
            finally
            { cnx.Close(); }
            return dato;
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("id_rol");
            Session.Remove("usuario");
            Response.Redirect("Login.aspx");
        }

    }
}