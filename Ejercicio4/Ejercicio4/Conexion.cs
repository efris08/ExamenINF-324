using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
namespace Ejercicio4
{
    public class Conexion
    {
        private readonly MySqlConnection cnx = null;
        private readonly MySqlConnectionStringBuilder cadena = new MySqlConnectionStringBuilder();
        string connStr = ConfigurationManager.AppSettings["connection"];
        public string cadena_ext = "";
        public Conexion()
        {
            cadena.Server = @"localhost";
            cadena.UserID = "root";
            cadena.Password = "1235";
            cadena.Database = "db_callisaya";
            cadena.Port = 3306;
            cnx = new MySqlConnection(cadena.ToString());
            cadena_ext = cadena.ToString();
        }

        public string get_cadena()
        {
            return cadena_ext;
        }
        public Boolean Conectar()
        {//Devuelve TRUE si está conectado a la Base de Datos y FALSE si no.
            try
            {
                cnx.Open();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            { cnx.Close(); }
        }
        public MySqlConnection Cnx()
        {
            return cnx;
        }

    }
}