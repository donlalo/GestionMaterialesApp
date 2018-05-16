using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.Data;



namespace WebArduino
{
    class Conectar
    {
        private MySqlConnection conexion = new MySqlConnection("Server=localhost;Port=3040;Database=ejemplo1;Uid=root;Pwd=eduardo123");
        private MySqlCommand cmd = new MySqlCommand();
        private MySqlDataReader dr;
        private String tipoUser = "";

        public MySqlConnection Conexion()
        {
            return conexion;
        }

        public String tipoUsuario()
        {
            return tipoUser;
        }
        public void iniciarConexion()
        {
            try
            {
                conexion.Open();
            }
            catch (Exception e)
            {
                MessageBox.Show("error al conectar : "+e.Message);
            }
        }

        public void terminarConexion()
        {
            try
            {
                
                conexion.Close();
                
            }
            catch (Exception e)
            {
                MessageBox.Show("error al terminar conexion : "+e.Message);
            }
        }

        public bool validarUsuario(string user,int pass)
        {
            string q = "select tipo from usuario where nickname='"+user+"' and pass="+pass;
            bool r = false;
            
            cmd.Connection = conexion;
            cmd.CommandText = q;
            dr = cmd.ExecuteReader();
            if(!dr.HasRows)
            {
               r = false;
            }
            else
            {
                while (dr.Read())
                {
                   if (dr != null)
                   {
                       tipoUser = dr[0].ToString();
                       r = true;
                            
                   }
                        
                 }
                    
            }
            
            return r;
        }

        
        /**********************************************************/
    }
}
